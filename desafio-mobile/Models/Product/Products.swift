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
//        case products = "Products"
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
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let products = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .products)
//
//        availability = try products.decode(Bool.self, forKey: .availability)
//        skus = try products.decode([Product].self, forKey: .skus)
//        name = try products.decode(String.self, forKey: .name)
//        id = try products.decode(String.self, forKey: .id)
//        brand = try products.decode(String.self, forKey: .brand)
//        description = try products.decode(String.self, forKey: .description)
//        category = try products.decode(String.self, forKey: .category)
//        categories = try products.decode([String].self, forKey: .categories)
//        specifications = try products.decode([String : String].self, forKey: .specifications)
//        variations = try products.decode([String].self, forKey: .variations)
//        realId = try products.decode(String.self, forKey: .realId)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        var products = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .products)
//
//        try products.encode(availability, forKey: .availability)
//        try products.encode(skus, forKey: .skus)
//        try products.encode(name, forKey: .name)
//        try products.encode(id, forKey: .id)
//        try products.encode(brand, forKey: .brand)
//        try products.encode(description, forKey: .description)
//        try products.encode(category, forKey: .category)
//        try products.encode(specifications, forKey: .specifications)
//        try products.encode(variations, forKey: .variations)
//        try products.encode(realId, forKey: .realId)
//    }
}
