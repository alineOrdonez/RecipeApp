//
//  CategoryService.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 03/10/20.
//

import Foundation
import NetKit

class CategoryService: ServiceProtocol {
    
    var networkManager: NetworkProtocol
    
    required init(networkManager: NetworkProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchData<T: Decodable>(params: String?, responseType: T.Type, completion: @escaping (Result<T>) -> Void) {
        let request = RecipeRequest(path: "categories")
        networkManager.executeRequest(request, completion: completion)
    }
}
