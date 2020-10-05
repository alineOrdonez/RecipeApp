//
//  CountryListViewModel.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 01/10/20.
//

import Foundation

class CountryListViewModel: ObservableObject {
    
    // MARK: - Properties
    private let service = RecipeService()
    @Published var list: [Area]?
    
    // MARK: - Methods
    func getAllAreas() {
        service.getAreas { result in
            switch result {
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            case .success(let value):
                self.list = value.areas
            }
        }
    }
    
}
