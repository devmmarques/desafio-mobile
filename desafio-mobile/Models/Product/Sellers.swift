//
//  Sellers.swift
//  desafio-mobile
//
//  Created by Marco Marques on 22/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

struct Sellers: Codable {
    
    let id: String
    let name: String
    let quantity: Int
    let price: Double
    let listPrice: Double
    let bestInstallment: BestInstallment
    let offer: Int?
    
    init(id: String, name: String, quantity: Int, price: Double, listPrice: Double, bestInstallment: BestInstallment, offer: Int = 0) {
        self.id = id
        self.name = name
        self.quantity = quantity
        self.price = price
        self.listPrice = listPrice
        self.bestInstallment = bestInstallment
        self.offer = offer
    }
    
     private enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case quantity = "Quantity"
        case price = "Price"
        case listPrice = "ListPrice"
        case bestInstallment = "BestInstallment"
        case offer = "Offer"
    }
}
