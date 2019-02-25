//
//  Category.swift
//  desafio-mobile
//
//  Created by Marco Marques on 25/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

struct Category: Codable {
    
    let id: Int
    let name: String
    let subCategory: [SubCategory]
    
    init(id: Int, name: String, subCategory: [SubCategory]) {
        self.id = id
        self.name = name
        self.subCategory = subCategory
    }
    
    private enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case subCategory = "SubCategories"
    }
}
