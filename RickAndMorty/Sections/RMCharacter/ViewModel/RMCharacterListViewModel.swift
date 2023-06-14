//
//  RMCharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Uriel Rodriguez on 14/06/23.
//

import Foundation

struct RMCharacterListViewModel {
    func fetchCharacters() {
        RMService.shared.getAllCharacters { result in
            if case .success(let characters) = result {
                print(characters)
                dump(characters)
            } else if case .failure(let error) = result {
                print(error)
                dump(error)
            }
        }
    }
}
