//
//  Images.swift
//  desafio-mobile
//
//  Created by Marco Marques on 22/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

struct Images: Codable {
    
    let imageUrl: String?
    let imageTag: String?
    let label: String?
    
    init(imageUrl: String?, imageTag: String?, label: String?) {
        self.imageUrl = imageUrl
        self.imageTag = imageTag
        self.label = label
    }
    
    private enum CodingKeys: String, CodingKey {
        case imageUrl = "ImageUrl"
        case imageTag = "imageTag"
        case label = "label"
    }
}
