//
//  EnvironmentConfig.swift
//  desafio-mobile
//
//  Created by Marco Marques on 23/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation


struct EnvironmentConfig {
    
    private static var environments: [String: Any]? {
        guard let dict: [String: Any] = Bundle.main.infoDictionary?["EnvironmentConfig"] as? [String: Any] else { return nil }
        return dict
    }
    
    static var host: String {
        guard let value = environments?["HOST"] as? String else { return "" }
        return value
    }
}
