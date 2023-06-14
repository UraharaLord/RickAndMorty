//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Uriel Rodriguez on 13/06/23.
//

import Foundation

final class RMRequest {
    private struct Constants {
        static let baseURL = "https://rickandmortyapi.com/api"
    }
    
    /// Setup desired endpoint
    private let endPoint: RMEndPoint
    
    /// Path componentes for Api
    private let pathComponents: Set<String>
    
    /// Query arguments for Api
    private let queryParameters: [URLQueryItem]
    
    /// Constructed url for the  api request in String, we want to do the same for send data in the body or header
    private var urlString: String {
        var string = Constants.baseURL
        string += "/"
        string += endPoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            string += argumentString
        }
        
        return string
    }
    
    /// Constructed Url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Http method
    public let httpMethod = "GET"
    
    /// Construct Request
    ///  - Parameters:
    ///     - endPoint: Tarjet end point
    ///     - pathComponents: Collection of path components
    ///     - queryParameters: Collection of query parameters
    init (endPoint: RMEndPoint, pathComponents: Set<String>] = [], queryParameters: [URLQueryItem] = []) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
