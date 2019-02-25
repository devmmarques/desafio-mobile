//
//  CategoryResponse.swift
//  desafio-mobile
//
//  Created by Marco Marques on 25/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

struct CategoryResponse: Codable{

    let categories: [Category]?
    
    init(categories: [Category]?) {
        self.categories = categories
    }
    
    private enum CodingKeys: String, CodingKey {
        case categories = "Categories"
    }
}
