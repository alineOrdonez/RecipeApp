//
//  CategoryListViewModel.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 01/10/20.
//

import Foundation

class CategoryListViewModel: ObservableObject {
    
    // MARK: - Properties
    private let service: ServiceProtocol
    @Published var list: [Category]?
    
    init(service: ServiceProtocol = CategoryService()) {
        self.service = service
    }
    
    // MARK: - Methods
    func getAllCategories() {
        service.fetchData(params: nil, responseType: CategoryList.self) { result in
            switch result {
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            case .success(let value):
                self.list = value.categories
            }
        }
    }
    
}
