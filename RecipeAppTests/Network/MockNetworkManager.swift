//
//  MockNetworkManager.swift
//  RecipeAppTests
//
//  Created by Aline Arely Ordonez Garcia on 04/10/20.
//

import Foundation
import NetKit
@testable import RecipeApp

class MockNetworkManager: NetworkProtocol {
    
    func executeRequest<T>(_ request: RequestProtocol, completion: @escaping (Result<T>) -> Void) where T : Decodable {
        
        let file = request.url
        
        guard let data = TestServer.loadJsonFile(file) else {
           return completion(.failure(NetworkingError.invalidJSON))
        }
        
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        } catch {
            print("Failed to decode \(file) error: \(error.localizedDescription)")
            completion(.failure(NetworkingError.invalidJSON))
        }
    }
}
