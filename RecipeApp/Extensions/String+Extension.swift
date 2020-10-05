//
//  String+Extension.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 01/10/20.
//

import Foundation

extension String {
    
    func isValidURL() -> Bool {
        return self.hasPrefix("https://")
    }
}
