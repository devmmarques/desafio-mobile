//
//  CategoryRouter.swift
//  desafio-mobile
//
//  Created by Marco Marques on 25/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

enum CategoryRouter {
    case category()
}

extension CategoryRouter: APIRouter {
    
    var path: String {
        return "/StorePreference/CategoryTree"
    }
    
    var method: NamespaceHTTPMethod {
        return .get
    }
    
    var encoding: NamespaceParameterEncoding {
        return .json
    }
}
