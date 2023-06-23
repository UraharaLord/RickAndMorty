//
//  RMGetAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by Uriel Rodriguez on 14/06/23.
//

import Foundation

// MARK: - RMGetAllCharactersResponse

struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }

    let info: Info
    let results: [RMCharacter]
}
