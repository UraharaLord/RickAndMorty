//
//  RMService.swift
//  RickAndMorty
//
//  Created by Uriel Rodriguez on 13/06/23.
//

import Foundation

final class RMService {
    
    static let shared = RMService()
    
    private var tokenSesion: String = ""
    typealias Callback<T> = (Result<T, Error>) -> Void
    
    init() {}
    
    /// save token in singleton instance
    public func setToken(from autToken: String) {
        tokenSesion = autToken
    }
    
    // MARK: - Private
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        
        /// Set Http method Selection
        var request = URLRequest (url: url)
            request.httpMethod = rmRequest.httpMethodSelection.rawValue
        
        /// Set Http Body if this is Available
        if rmRequest.isBodyData {
            request.httpBody = rmRequest.getBodyHttpData()
        }
        
        /// add headers and Rerturn URLRequest por urlSession
        return addHttpHeaderFields(urlRequest: request)
    }
    
    private func addHttpHeaderFields( urlRequest: URLRequest) -> URLRequest{
        var request = urlRequest
            request.setValue("Content-Type", forHTTPHeaderField: "application/json")
            request.setValue("Authorization", forHTTPHeaderField: tokenSesion)
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
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            guard let data = data, error == nil else {
                callback(.failure(error ?? RMServiceError.faildedtoGetData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...300) ~= response.statusCode  else {
                callback(.failure(error ?? RMServiceError.failStatusCode))
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
