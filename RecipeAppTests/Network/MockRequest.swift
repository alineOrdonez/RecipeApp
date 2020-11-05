//
//  MockRequest.swift
//  RecipeAppTests
//
//  Created by Aline Arely Ordonez Garcia on 04/10/20.
//

import Foundation
import NetKit

class MockRequest: RequestProtocol {
    var url: String
    
    var httpMethod: HTTPMethod
    
    var params: [String : Any]?
    
    var timeoutInterval: TimeInterval
    
    var headers: [String : String]?
    
    var cachePolicy: URLRequest.CachePolicy
    
    required init(url: String, httpMethod: HTTPMethod = .get, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeoutInterval: TimeInterval = 10.0) {
        self.url = url
        self.httpMethod = httpMethod
        self.cachePolicy = cachePolicy
        self.timeoutInterval = timeoutInterval
        self.headers = [String: String]()
    }
    
    convenience init(fileName: String) {
        self.init(url: fileName)
    }
    
    func makeRequest() -> URLRequest {
        let file = URL(string: url)!
        return URLRequest(url: file, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
    }
    
    
}

