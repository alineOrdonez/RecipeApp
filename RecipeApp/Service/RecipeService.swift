//
//  RecipeService.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 01/10/20.
//

import Foundation
import NetKit

class RecipeService: ServiceProtocol {
    
    var networkManager: NetworkProtocol
    
    required init(networkManager: NetworkProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchData<T: Decodable>(params: String?, responseType: T.Type, completion: @escaping (Result<T>) -> Void) {
        let string = "i=\(params!)"
        let request = RecipeRequest(path: "lookup", search: string)
        networkManager.executeRequest(request, completion: completion)
    }
}
