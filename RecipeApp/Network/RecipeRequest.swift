//
//  RecipeRequest.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 01/10/20.
//

import Foundation
import NetKit

class RecipeRequest: RequestProtocol {
    
    fileprivate(set) var url: String
    var httpMethod: HTTPMethod
    var params: [String: Any]?
    var timeoutInterval: TimeInterval
    var headers: [String: String]?
    var cachePolicy: URLRequest.CachePolicy
    var customHeaders: [String: String]
    
    // MARK: - Initializers
    required init(url: String, httpMethod: HTTPMethod, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeoutInterval: TimeInterval) {
        self.url = url
        self.httpMethod = httpMethod
        self.cachePolicy = cachePolicy
        self.timeoutInterval = timeoutInterval
        self.customHeaders = [String: String]()
    }
    
    convenience init(path: String, search: String? = nil, timeoutInterval: TimeInterval = 10.0) {
        var urlString = "https://www.themealdb.com/api/json/v1/1/\(path).php?"
        
        if let search = search {
            urlString.append(search)
        }
    
        self.init(url: urlString, httpMethod: .get, timeoutInterval: timeoutInterval)
    }
    
    func makeRequest() -> URLRequest {
        guard let urlFromString = URL(string: url) else  {
            fatalError()
        }
        var urlRequest = URLRequest(url: urlFromString, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = headers
        return urlRequest
    }
}
