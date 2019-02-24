//
//  BestInstallment.swift
//  desafio-mobile
//
//  Created by Marco Marques on 22/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

struct BestInstallment: Codable {
    
    let count: Int
    let value: Double
    let total: Double
    let rate: Int
    
    init(count: Int, value: Double, total: Double, rate: Int) {
        self.count = count
        self.value = value
        self.total = total
        self.rate = rate
    }
    
    private enum CodingKeys: String, CodingKey {
        case count = "Count"
        case value = "Value"
        case total = "Total"
        case rate = "Rate"
    }
}
