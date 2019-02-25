//
//  SubCategory.swift
//  desafio-mobile
//
//  Created by Marco Marques on 25/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

struct SubCategory: Codable {
    
    let id: Int
    let name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    private enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
    }
}
