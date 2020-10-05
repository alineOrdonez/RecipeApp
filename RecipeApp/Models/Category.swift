//
//  Category.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 01/10/20.
//

import Foundation

struct Category: Codable, Hashable {
    let id: String
    let name: String
    let image: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case image = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
}

struct CategoryList: Codable {
    let categories: [Category]
}
