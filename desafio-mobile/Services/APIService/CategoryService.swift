//
//  CategoryService.swift
//  desafio-mobile
//
//  Created by Marco Marques on 25/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import class Foundation.NSObject

protocol CategoryServiceProtocol {
    func fetchCategory(completion: @escaping (APIResult<CategoryResponse>) -> Void)
}

final class CategoryService: NSObject, CategoryServiceProtocol {
    
    private let apiClient: APIClientProtocol
    
    override init() {
        self.apiClient = APIClient()
    }
    
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func fetchCategory(completion: @escaping (APIResult<CategoryResponse>) -> Void) {
        let router = CategoryRouter.category()
        self.apiClient.request(router: router){ (response: APIResult<CategoryResponse>) in
            switch response {
            case let .success(value):
                completion(.success(value))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
