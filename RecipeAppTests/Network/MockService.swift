//
//  MockService.swift
//  RecipeAppTests
//
//  Created by Aline Arely Ordonez Garcia on 02/10/20.
//

import XCTest
import NetKit
@testable import RecipeApp

class MockService: ServiceProtocol {
    
    
    var networkManager: NetworkProtocol
    var request: RequestProtocol
    
    required init(networkManager: NetworkProtocol, request: RequestProtocol) {
        self.networkManager = networkManager
        self.request = request
    }
    
    func fetchData<T>(params: String? = nil, responseType: T.Type, completion: @escaping (Result<T>) -> Void) where T : Decodable {
        networkManager.executeRequest(request, completion: completion)
    }
    
}
