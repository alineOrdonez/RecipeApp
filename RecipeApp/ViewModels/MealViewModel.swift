//
//  MealViewModel.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 01/10/20.
//

import Foundation

class MealViewModel: ObservableObject {
    
    // MARK: - Properties
    private let service = RecipeService()
    @Published var list: [Meal]?
    
    // MARK: - Methods
    func filterRecipesBy(_ type: FilterType, word: String) {
        service.filterRecipes(type, search: word) { result in
            switch result {
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            case .success(let value):
                self.list = value.meals
            }
        }
    }
    
}
