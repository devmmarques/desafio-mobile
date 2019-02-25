//
//  ProductsPresenter.swift
//  desafio-mobile
//
//  Created by Marco Marques on 24/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

class ProductsPresenter {
    
    private let viewProtocol: ProductsProtocol?
    
    private let serviceAPI = ProductService(apiClient: APIClient())
    private var products: [Products] = []
    
    init(viewProtocol: ProductsProtocol) {
        self.viewProtocol = viewProtocol
    }
    
    
    func fetchProducts(name: String) {
        self.viewProtocol?.showLoading()
        self.serviceAPI.fetchProduct(name: name) { [weak self] result in
            switch result {
            case let .success(response):
                self?.products = response.products
                self?.viewProtocol?.dismissLoading()
                self?.viewProtocol?.show()
            case .failure:
                self?.viewProtocol?.dismissLoading()
            }
        }
    }
    
    func getProduct(index: Int) -> Products {
        return products[index]
    }
    
    func getCountProduct() -> Int {
        return products.count
    }
    
    
    
}
