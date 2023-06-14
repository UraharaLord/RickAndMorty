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
}

extension RMCharacterViewController {
    func serviceBind() {
//   -----Form to call 1 with params-----------------------------------------------------------------------------------------------------
//
//        let request = RMRequest(endPoint: .character, queryParameters: [
//            URLQueryItem(name: "name", value: "rick"),
//            URLQueryItem(name: "status", value: "alive")
//        ])
//
//        print(request.url)
//        dump(request.url)
//
//        RMService.shared.execute(request, expecting: RMCharacter.self) { result in
//            if case .success(let characters) = result {
//
//            } else if case .failure(let error) = result {
//
//            }
//        }

//   -----Form to call 2 with parameters-----------------------------------------------------------------------------------------------------
//        RMService.shared.execute(.listOfCharactersRequest, expecting: RMGetAllCharactersResponse.self) { result in
//            if case .success(let characters) = result {
//                print(characters)
//                dump(characters)
//            } else if case .failure(let error) = result {
//                print(error)
//                dump(error)
//            }
//        }
        
//   ---Form to call 3 more simple-------------------------------------------------------------------------------------------------------
        RMService.shared.getAllCharacters { result in
            if case .success(let characters) = result {
                dump(characters)
            } else if case .failure(let error) = result {
                dump(error)
            }
        }
    }
}

