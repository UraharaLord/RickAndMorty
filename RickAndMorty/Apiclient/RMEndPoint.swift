//
//  RMEndPoint.swift
//  RickAndMorty
//
//  Created by Uriel Rodriguez on 13/06/23.
//

import Foundation

/// Represents unique API endpoint
@frozen enum RMEndPoint: String {
    case empty
    /// Endpoint to get character info
    case character
    /// Endpoint to get location info
    case location
    // Endpoint to get episode info
    case episode
}
