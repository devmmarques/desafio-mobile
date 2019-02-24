//
//  Response.swift
//  desafio-mobile
//
//  Created by Marco Marques on 23/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

struct SearchResponse: Codable {
    
    let size: Int
    let total: Int
    let delay: Double
    let products: [Products]
    
    init(size: Int, total: Int, delay: Double, products: [Products]) {
        self.size = size
        self.total = total
        self.delay = delay
        self.products = products
    }
    
    private enum CodingKeys: String, CodingKey {
        case size = "Size"
        case total = "Total"
        case delay = "Delay"
        case products = "Products"
        
    }
}
