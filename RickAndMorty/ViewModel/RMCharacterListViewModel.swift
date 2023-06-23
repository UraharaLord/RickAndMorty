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
            if case let .success(characters) = result {
                print(characters)
                dump(characters)
            }
            
            if case let .failure(error) = result {
                print(error)
                dump(error)
            }
        }
    }
}
