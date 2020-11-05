//
//  MealService.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 04/10/20.
//

import Foundation
import NetKit

class MealService: ServiceProtocol {
    
    var networkManager: NetworkProtocol
    
    required init(networkManager: NetworkProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchData<T: Decodable>(params: String?, responseType: T.Type, completion: @escaping (Result<T>) -> Void) {
        let request = RecipeRequest(path: "filter", search: params)
        networkManager.executeRequest(request, completion: completion)
    }
}
