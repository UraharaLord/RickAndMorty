//
//  RMServiceError.swift
//  RickAndMorty
//
//  Created by Uriel Rodriguez on 14/06/23.
//

import Foundation

enum RMServiceError: Error {
    case none
    case failedtoCreateRequest
    case faildedtoGetData
    case failStatusCode
}
