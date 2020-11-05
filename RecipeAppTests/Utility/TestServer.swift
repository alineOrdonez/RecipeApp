//
//  TestServer.swift
//  RecipeAppTests
//
//  Created by Aline Arely Ordonez Garcia on 02/10/20.
//

import Foundation

class TestServer {
    
    static func loadJsonFile(_ name: String) -> Data? {
        
        let bundle = Bundle(for: TestServer.self)
        
        guard let jsonFileURL = bundle.path(forResource: name, ofType: "json") else {
            return nil
        }
        do {
            let content = try String(contentsOfFile: jsonFileURL)
            return content.data(using: String.Encoding.utf8)
        } catch {
            return nil
        }
    }
}
