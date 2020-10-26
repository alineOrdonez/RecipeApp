//
//  RecipeVieModel.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 01/10/20.
//

import Foundation
import NetKit

class RecipeVieModel: ObservableObject {
    
    // MARK: - Properties
    private let service = RecipeService()
    @Published var recipe: Recipe?
    
    // MARK: - Methods
    func filterRecipesBy(id: String) {
        service.getRecipeBy(id) { result in
            switch result {
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            case .success(let value):
                guard let recipe = value.meals.first else {
                    return print("No results")
                }
                self.recipe = recipe
            }
        }
    }
    
}
