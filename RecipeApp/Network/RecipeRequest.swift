//
//  RecipeRequest.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 01/10/20.
//

import Foundation
import NetKit

class RecipeRequest: RequestProtocol {
    
    fileprivate(set) var url: URL
    var httpMethod: HTTPMethod
    var params: [String: Any]?
    var timeoutInterval: TimeInterval
    var headers: [String: String]?
    var cachePolicy: URLRequest.CachePolicy
    var customHeaders: [String: String]
    
    // MARK: - Initializers
    required init(url: URL, httpMethod: HTTPMethod, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeoutInterval: TimeInterval) {
        self.url = url
        self.httpMethod = httpMethod
        self.cachePolicy = cachePolicy
        self.timeoutInterval = timeoutInterval
        self.customHeaders = [String: String]()
    }
    
    convenience init(path: String, search: String?, timeoutInterval: TimeInterval) {
        var urlString = "https://www.themealdb.com/api/json/v1/1/\(path).php?"
        
        if let search = search {
            urlString.append(search)
        }
        
        let url = URL(string: urlString)!
        self.init(url: url, httpMethod: .get, timeoutInterval: timeoutInterval)
    }
    
    func makeRequest() -> URLRequest {
        var urlRequest = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = headers
        return urlRequest
    }
}
