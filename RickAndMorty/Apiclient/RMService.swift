//
//  RMService.swift
//  RickAndMorty
//
//  Created by Uriel Rodriguez on 13/06/23.
//

import Foundation

final class RMService {
    
    static let shared = RMService()
    
    private init() {}
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    /// - request: Request instance
    /// - Completion: Callback with data or error
    public func execute(_ request: RMRequest, completion: @escaping() -> Void) {
        
    }
}
