//
//  Service.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 01/10/20.
//

import Foundation
import NetworkLayerFramework

class Service {
    
    var networkManager = NetworkManager()
    
    func executeRequest<T>(path: String,
                           search: String? = nil,
                           timeout: TimeInterval = 30.0,
                           completion: @escaping (Result<T>) -> Void) where T: Decodable {
        
        let request = RecipeRequest(path: path, search: search, timeoutInterval: timeout)
        networkManager.executeRequest(request, completion: completion)
    }
}
