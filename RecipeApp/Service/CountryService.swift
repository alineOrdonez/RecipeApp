//
//  CountryService.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 04/10/20.
//

import Foundation
import NetKit

class CountryService: ServiceProtocol {
    
    var networkManager: NetworkProtocol
    
    required init(networkManager: NetworkProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchData<T: Decodable>(params: String? = nil, responseType: T.Type, completion: @escaping (Result<T>) -> Void) {
        let request = RecipeRequest(path: "list", search: "a=list")
        networkManager.executeRequest(request, completion: completion)
    }
}
