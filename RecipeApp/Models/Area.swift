//
//  Area.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 01/10/20.
//

import Foundation

struct Area: Codable, Identifiable, Hashable {
    let id = UUID()
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name = "strArea"
    }
}

struct AreaList: Codable {
    let areas: [Area]
    
    enum CodingKeys: String, CodingKey {
        case areas = "meals"
    }
}
