//
//  Variations.swift
//  desafio-mobile
//
//  Created by Marco Marques on 22/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

struct Variations: Codable {
    
    let voltagem: [String]
    let cor: [String]
    
    init(voltagem: [String], cor: [String]) {
        self.voltagem = voltagem
        self.cor = cor
    }
    
    private enum CodingKeys: String, CodingKey {
        case voltagem = "Voltagem"
        case cor = "Cor"
    }
}
