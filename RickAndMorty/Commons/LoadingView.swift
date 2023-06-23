//
//  LoadingView.swift
//  RickAndMorty
//
//  Created by Uriel Rodriguez on 14/06/23.
//

import Foundation
import UIKit

public enum LoadingStyle {
    case plain
    case box
}

public enum LoadingView {
    public static var currentOverlay: UIView?

    public static func show() {
        DispatchQueue.main.async {
            guard let currentMainWindow = UIWindow.key else {
                return
            }
            show(currentMainWindow)
        }
    }

    public static func show(_ loadingText: String) {
        DispatchQueue.main.async {
            guard let currentMainWindow = UIWindow.key else {
                return
            }
            show(currentMainWindow, loadingText: loadingText, style: .plain)
        }
    }

    public static func show(_ overlayTarget: UIView) {
        show(overlayTarget, loadingText: nil)
    }

    public static func show(_ overlayTarget: UIView, loadingText: String?, style: LoadingStyle = .plain) {
        // Clear it first in case it was already shown
        //        hide()
        currentOverlay?.removeFromSuperview()
        currentOverlay = nil
        hide {
            // Create the overlay

            let overlay = UIView(frame: overlayTarget.frame)
            overlay.center = overlayTarget.center
            //        overlay.alpha = 0
            overlay.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            overlayTarget.addSubview(overlay)
            overlayTarget.bringSubviewToFront(overlay)

            // Create and animate the activity indicator
            let indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large) // whitelage -> large
            indicator.center = overlay.center
            indicator.color = .white
            indicator.startAnimating()
            overlay.addSubview(indicator)
            overlay.bringSubviewToFront(indicator)
            // Create label
            if let textString = loadingText {
                let label = UILabel()
                label.text = textString
                label.textColor = UIColor.white
                label.sizeToFit()
                label.center = CGPoint(x: indicator.center.x, y: indicator.center.y + 30)
                overlay.addSubview(label)

                if style == .box {
                    label.numberOfLines = 0
                    var frame = label.frame
                    frame.size = CGSize(width: overlayTarget.bounds.width - 80, height: 0)
                    label.frame = frame
                    label.textAlignment = .center
                    label.sizeToFit()
                    label.center = CGPoint(x: indicator.center.x, y: indicator.center.y + (label.frame.height / 2) + (indicator.frame.height / 2))
                    indicator.color = UIColor.white
                    let boxLayer = CALayer()
                    boxLayer.backgroundColor = UIColor.white.cgColor
                    let heightBox = max(80, label.frame.size.height + 60)
                    let yIndicator = indicator.center.y - (indicator.frame.height - 10 / 2)
                    boxLayer.frame = CGRect(x: 40, y: yIndicator, width: overlayTarget.bounds.width - 80, height: heightBox)

                    overlay.layer.insertSublayer(boxLayer, at: 0)
                    label.textColor = .black
                }
            }

            // Animate the overlay to show
//            UIView.beginAnimations(nil, context: nil)
//
//
//            UIView.setAnimationDuration(0.3)
//            //        overlay.alpha = overlay.alpha > 0 ? 0 : 0.5
//            UIView.commitAnimations()
//
//            currentOverlay = overlay

            UIView.animate(withDuration: 0.3) {
                // Configurar las animaciones aquí
                self.currentOverlay = overlay
            }
        }
    }

    public static func hide(_ complete: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            if currentOverlay != nil {
                UIView.animate(withDuration: 0.4, animations: { [weak currentOverlay] in
                    guard let overlay = currentOverlay else { return }
                    overlay.alpha = 0.0

                }) { isComplete in
                    currentOverlay?.removeFromSuperview()
                    currentOverlay = nil
                    if isComplete {
                        complete?()
                    }
                }
            } else {
                complete?()
            }
        }
    }
}

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
