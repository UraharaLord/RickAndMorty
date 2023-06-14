//
//  RMCharacter.swift
//  RickAndMorty
//
//  Created by Uriel Rodriguez on 08/06/23.
//

import Foundation

// MARK: - RMCharacter
struct RMCharacter: Codable {
    let id: Int
    let name: String
    let status: RMCharacterStatus
    let species: String
    let type: String
    let gender: RMGender
    let origin: RMOrigin
    let location: RMCharacterLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
