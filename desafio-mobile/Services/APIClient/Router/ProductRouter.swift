//
//  ProductRouter.swift
//  desafio-mobile
//
//  Created by Marco Marques on 23/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

enum ProductRouter {
    case search(name: String)
}

extension ProductRouter: APIRouter {
    
    var path: String {
        switch self {
        case .search(name: _):
            return "/Search/Criteria"
        }
    }
    
    var method: NamespaceHTTPMethod {
        switch self {
        case .search(name: _):
            return .post
        }
    }
    
    var encoding: NamespaceParameterEncoding {
        return .json
    }
    
    var parameters: [String: Any] {
        switch self {
        case .search(let name):
            return ["Query": name, "Offset": 0, "Size": 10]
        }
    }
    
}
