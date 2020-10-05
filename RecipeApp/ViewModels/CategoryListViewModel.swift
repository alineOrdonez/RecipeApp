//
//  CategoryListViewModel.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 01/10/20.
//

import Foundation

class CategoryListViewModel: ObservableObject {
    
    // MARK: - Properties
    private let service = RecipeService()
    @Published var list: [Category]?
    
    // MARK: - Methods
    func getAllCategories() {
        service.getCategories { result in
            switch result {
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            case .success(let value):
                self.list = value.categories
            }
        }
    }
    
}
