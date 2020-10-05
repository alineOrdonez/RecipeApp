//
//  Recipe.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 01/10/20.
//

import Foundation

struct Recipe: Codable {
    let id: String
    let name: String
    let category: String
    let area: String
    let instructions: String
    let image: String
    let video: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case image = "strMealThumb"
        case video = "strYoutube"
    }
}

struct RecipeList: Codable {
    let meals: [Recipe]
}
