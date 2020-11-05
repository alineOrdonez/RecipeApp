//
//  TestError.swift
//  RecipeAppTests
//
//  Created by Aline Arely Ordonez Garcia on 02/10/20.
//

import Foundation

enum TestError: Error {
    case fileNotFound(_ filePath: String)
    case deserializationFailed(jsonSerializationError: Error, data: Data)
    case invalidJSON(_ object: Any)
}
