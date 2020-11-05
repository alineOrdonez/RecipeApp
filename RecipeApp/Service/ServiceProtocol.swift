//
//  ServiceProtocol.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 04/10/20.
//

import Foundation
import NetKit

protocol ServiceProtocol {
    func fetchData<T: Decodable>(params: String?, responseType: T.Type, completion: @escaping (Result<T>) -> Void)
}
