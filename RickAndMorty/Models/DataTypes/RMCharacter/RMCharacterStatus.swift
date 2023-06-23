//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Uriel Rodriguez on 13/06/23.
//

import Foundation

// MARK: - RMCharacterStatus

enum RMCharacterStatus: String, Codable {
    case dead = "Dead"
    case alive = "Alive"
    case unknown
}
