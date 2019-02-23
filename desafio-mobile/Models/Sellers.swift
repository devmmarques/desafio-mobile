//
//  Sellers.swift
//  desafio-mobile
//
//  Created by Marco Marques on 22/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

struct Sellers: Codable {
    
    let id: Int
    let name: String
    let quantity: Int
    let price: Double
    let listPrice: Double
    let bestInstallment: BestInstallment
    
    init(id: Int, name: String, quantity: Int, price: Double, listPrice: Double, bestInstallment: BestInstallment) {
        self.id = id
        self.name = name
        self.quantity = quantity
        self.price = price
        self.listPrice = listPrice
        self.bestInstallment = bestInstallment
    }
    
     private enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case quantity = "Quantity"
        case price = "Price"
        case listPrice = "ListPrice"
        case bestInstallment = "BestInstallment"
    }
}
