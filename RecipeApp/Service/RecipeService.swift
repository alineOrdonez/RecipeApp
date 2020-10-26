//
//  RecipeService.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 01/10/20.
//

import Foundation
import NetKit

class RecipeService: Service {
    
    // MARK: - Filters
    func filterRecipes(_ type: FilterType, search: String, completion: @escaping (Result<MealList>) -> Void) {
        let string = "\(type.rawValue)=\(search)"
        executeRequest(path: "filter", search: string, completion: completion)
    }
    
    // MARK: - Lists
    func getAreas(completion: @escaping (Result<AreaList>) -> Void) {
        let string = "a=list"
        executeRequest(path: "list", search: string, completion: completion)
    }
    
    func getCategories(completion: @escaping (Result<CategoryList>) -> Void) {
        executeRequest(path: "categories", completion: completion)
    }
    
    // MARK: - Detail
    func getRecipeBy(_ id: String, completion: @escaping (Result<RecipeList>) -> Void) {
        let string = "i=\(id)"
        executeRequest(path: "lookup", search: string, completion: completion)
    }
}
