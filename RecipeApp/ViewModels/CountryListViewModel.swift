//
//  CountryListViewModel.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 01/10/20.
//

import Foundation

class CountryListViewModel: ObservableObject {
    
    // MARK: - Properties
    private let service:ServiceProtocol
    @Published var list: [Area]?
    
    init(service: ServiceProtocol = CountryService()) {
        self.service = service
    }
    
    // MARK: - Methods
    func getAllAreas() {
        service.fetchData(params: nil, responseType: AreaList.self) { result in
            switch result {
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            case .success(let value):
                self.list = value.areas
            }
        }
    }
    
}
