//
//  ProductRouter.swift
//  desafio-mobile
//
//  Created by Marco Marques on 23/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

enum ProductRouter {
    case products(page: Int)
    case search(name: String, page: Int)
}

extension ProductRouter: APIRouter {
    
    var path: String {
        return "/Search/Criteria"
    }
    
    var method: NamespaceHTTPMethod {
         return .post
    }
    
    var encoding: NamespaceParameterEncoding {
        return .json
    }
    
    var parameters: [String: Any] {
        switch self {
        case .products(let page):
            return ["Offset": page, "Size": 10]
        case .search(let name, let page):
            return ["Query": name, "Offset": page, "Size": 10]
        }
    }
    
}
