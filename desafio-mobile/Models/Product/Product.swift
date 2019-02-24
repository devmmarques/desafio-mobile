//
//  Product.swift
//  desafio-mobile
//
//  Created by Marco Marques on 22/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

struct Product: Codable {
    
    let id: String
    let name: String
    let sellers: [Sellers]
    let images: [Images]
    let variations: Variations
    let skuName: String
    let unitMultiplier: Int
    let complementName: String
    let measurementUnit: String
    let reference: [Reference]
    let ean: String
    
    init(id: String, name: String, sellers: [Sellers], images: [Images], variations: Variations, skuName: String, unitMultiplier: Int, complementName: String, measurementUnit: String, reference: [Reference], ean: String) {
        self.id = id
        self.name = name
        self.sellers = sellers
        self.images = images
        self.variations = variations
        self.skuName = skuName
        self.unitMultiplier = unitMultiplier
        self.complementName = complementName
        self.measurementUnit = measurementUnit
        self.reference = reference
        self.ean = ean
    }
    
    private enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case sellers = "Sellers"
        case images = "Images"
        case variations = "Variations"
        case skuName = "SkuName"
        case unitMultiplier = "UnitMultiplier"
        case complementName = "ComplementName"
        case measurementUnit = "MeasurementUnit"
        case reference = "ReferenceId"
        case ean = "EAN"
    }
}
