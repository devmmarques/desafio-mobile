//
//  ProductService.swift
//  desafio-mobile
//
//  Created by Marco Marques on 23/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import class Foundation.NSObject

protocol ProductServiceProtocol {
    func fetchProduct(name: String, completion: @escaping (APIResult<SearchResponse>) -> Void)
}

final class ProductService: NSObject, ProductServiceProtocol {

    private let apiClient: APIClientProtocol
    
    override init() {
        self.apiClient = APIClient()
    }
    
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }

    
    func fetchProduct(name: String, completion: @escaping (APIResult<SearchResponse>) -> Void) {
        let router = ProductRouter.search(name: name)
        apiClient.request(router: router) { (response: APIResult<SearchResponse>) in
            switch response {
            case let .success(value):
                completion(.success(value))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
