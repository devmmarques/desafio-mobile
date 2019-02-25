//
//  Products.swift
//  desafio-mobile
//
//  Created by Marco Marques on 23/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

struct Products: Codable {

    let availability: Bool
    let skus: [Sku]
    let name: String
    let id: String
    let brand: String
    let description: String
    let category: String
    let categories: [String]
    let specifications: [String : [String]]
    let variations: [String]
    let realId: String
    
    init(availability: Bool, skus: [Sku], name: String, id: String, brand: String, description: String, category: String, categories: [String], specifications: [String : [String]], variations: [String], realId: String) {
        self.availability = availability
        self.skus = skus
        self.name = name
        self.id = id
        self.brand = brand
        self.description = description
        self.category = category
        self.categories = categories
        self.specifications = specifications
        self.variations = variations
        self.realId = realId
    }
    
    private enum CodingKeys: String, CodingKey {
        case availability = "Availability"
        case skus = "Skus"
        case name = "Name"
        case id = "Id"
        case brand = "Brand"
        case description = "Description"
        case category = "Category"
        case categories = "Categories"
        case specifications = "Specifications"
        case variations = "Variations"
        case realId = "RealId"
    }
    
}
