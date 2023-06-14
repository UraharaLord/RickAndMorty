//
//  RMService.swift
//  RickAndMorty
//
//  Created by Uriel Rodriguez on 13/06/23.
//

import Foundation

enum RMServiceError: Error {
    case none
    case failedtoCreateRequest
    case faildedtoGetData
}

final class RMService {
    
    static let shared = RMService()
    
    typealias Callback<T> = (Result<T, Error>) -> Void
    
    private init() {}
    
    // MARK: - Private
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        
        var request = URLRequest (url: url)
            request.httpMethod = rmRequest.httpMethodSelection.rawValue
        return request
    }
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///     - request: Request instance
    ///     - type: The type of object to return
    ///     - Completion: Callback with data or error
    public func execute<T: Codable>(_ request: RMRequest, expecting type: T.Type, callback: @escaping Callback<T>) {
        guard let urlRequest = self.request(from: request) else {
            callback(.failure(RMServiceError.failedtoCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            
            guard let data = data, error == nil else {
                callback(.failure(error ?? RMServiceError.faildedtoGetData))
                return
            }
            
            do {
//                let json = try JSONSerialization.jsonObject(with: data) // data -> Json
                let json = try JSONDecoder().decode(type.self, from: data) // data -> Object
                callback(.success(json))
            } catch {
                callback(.failure(error))
            }
        }
        
        task.resume()
    }
}

extension RMService {
    // More simple and clean consult
    func getAllCharacters(callback: @escaping Callback<RMGetAllCharactersResponse>) {
//        here whants to setup request if we neded, example if we net another methotd like Post
//     // MARK: - Example change httpMethod  ->  let request = RMRequest(endPoint: .character, httpMethodSelection: .post)
        execute(.listOfCharactersRequest, expecting: RMGetAllCharactersResponse.self, callback: callback)
    }
}
