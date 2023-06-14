//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Uriel Rodriguez on 13/06/23.
//

import UIKit

class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScreen()
        serviceBind()
    }
    
    func setupScreen() {
        title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func serviceBind() {
        let request = RMRequest(endPoint: .character, queryParameters: [
            URLQueryItem(name: "name", value: "rick"),
            URLQueryItem(name: "status", value: "alive")
        ])
//
//        print(request.url)
//        dump(request.url)
        
        RMService.shared.execute(request, expecting: RMCharacter.self) { result in
            if case .success(let characters) = result {
                
            }
        }
    }
}
