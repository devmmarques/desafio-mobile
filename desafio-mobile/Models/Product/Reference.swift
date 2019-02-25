//
//  Reference.swift
//  desafio-mobile
//
//  Created by Marco Marques on 22/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

struct Reference: Codable {
    let key: String
    let value: String
    
    init(key: String, value: String) {
        self.key = key
        self.value = value
    }
    
    private enum CodingKeys: String, CodingKey {
        case key = "Key"
        case value = "Value"
    }
}
