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
    private var currentPage = 0
    private var totalProduct = 0
    private var products: [Products] = []
    private var nameSearch = ""
    
    init(viewProtocol: ProductsProtocol) {
        self.viewProtocol = viewProtocol
    }
    
    
    func fetchProducts(_ name: String = "") {
        self.viewProtocol?.showLoading()
        
        if self.products.count < self.totalProduct {
            self.currentPage += 1
        }
        
        if !self.isNameSearch() || !name.isEmpty {
            self.nameSearch = name
            self.currentPage = 0
            self.products = []
        }
        
        self.serviceAPI.fetchProduct(name: self.nameSearch, page: currentPage) { [weak self] result in
            switch result {
            case let .success(response):
                self?.totalProduct = response.total
                
                if let produtsResponse = response.products {
                   self?.products += produtsResponse
                }
                
                self?.viewProtocol?.dismissLoading()
                self?.viewProtocol?.show()
            case .failure:
                self?.viewProtocol?.dismissLoading()
            }
        }
    }
    
    func getProduct(index: Int) -> Products {
        return self.products[index]
    }
    
    func getCountProduct() -> Int {
        return self.products.count
    }
    
    func getTotalProduct() -> Int {
        return totalProduct
    }
    
    func cleanParameterRequest() {
        self.nameSearch = ""
        self.currentPage = 0
        self.products = []
        self.totalProduct = 0
    }
    
    func cleanNameSearch() {
        nameSearch = ""
        currentPage = 0
    }
    
    func isNameSearch() -> Bool {
        if nameSearch.isEmpty {
            return false
        }
        return true
    }
    
}
