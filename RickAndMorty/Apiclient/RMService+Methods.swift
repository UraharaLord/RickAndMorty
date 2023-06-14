//
//  RMService+Methods.swift
//  RickAndMorty
//
//  Created by Uriel Rodriguez on 14/06/23.
//

import Foundation

extension RMService {
//     More simple and clean consult
    
    func getAllCharacters(callback: @escaping Callback<RMGetAllCharactersResponse>) {
//      here whants to setup request if we neded, example if we net another methotd like Post
//      MARK: - Example change httpMethod  ->  let request = RMRequest(endPoint: .character, httpMethodSelection: .post)
        execute(.listOfCharactersRequest, expecting: RMGetAllCharactersResponse.self, callback: callback)
    }
}
