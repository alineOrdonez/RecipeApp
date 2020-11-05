//
//  MealViewModel.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 01/10/20.
//

import Foundation

class MealViewModel: ObservableObject {
    
    // MARK: - Properties
    private let service: ServiceProtocol
    @Published var list: [Meal]?
    
    init(service: ServiceProtocol = MealService()) {
        self.service = service
    }
    
    // MARK: - Methods
    func filterRecipesBy(_ type: FilterType, word: String) {
        let string = "\(type.rawValue)=\(word)"
        service.fetchData(params: string, responseType: MealList.self) { result in
            switch result {
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            case .success(let value):
                self.list = value.meals
            }
        }
    }
    
}
