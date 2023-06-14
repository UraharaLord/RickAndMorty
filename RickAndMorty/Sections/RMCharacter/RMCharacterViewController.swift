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
        
        title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
