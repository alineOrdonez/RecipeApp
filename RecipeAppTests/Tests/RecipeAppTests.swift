//
//  RecipeAppTests.swift
//  RecipeAppTests
//
//  Created by Aline Arely Ordonez Garcia on 01/10/20.
//

import XCTest
@testable import RecipeApp

class RecipeAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetAllCategories() throws {
        /* GIVEN */
        let request = MockRequest(fileName: "categories")
        let manager = MockNetworkManager()
        let service = MockService(networkManager: manager, request: request)
        let viewModel = CategoryListViewModel(service: service)
        
        /* WHEN */
        viewModel.getAllCategories()
        
        /* THEN */
        XCTAssertNotNil(viewModel.list, "Could not retrieve data from json file.")
    }
    
    func testErrorFromResponse() throws {
        let request = MockRequest(fileName: "another_file")
        let manager = MockNetworkManager()
        let service = MockService(networkManager: manager, request: request)
        
        service.fetchData(responseType: Category.self) { result in
            switch result {
            case .failure(let error):
                XCTAssertNil(error)
            case .success(let categories):
                XCTAssertNotNil(categories)
            }
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
