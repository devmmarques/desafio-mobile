//
//  CategoryPresenter.swift
//  desafio-mobile
//
//  Created by Marco Marques on 25/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

class CategoryPresenter {
    
    let viewProtocol: CategoryProtocol?
    private let serviceAPI = CategoryService(apiClient: APIClient())
    private var listCategory: [Category] = []
    
    init(viewProtocol: CategoryProtocol) {
        self.viewProtocol = viewProtocol
    }
    
    public func fetchCategory() {
        self.viewProtocol?.showLoading()
        self.serviceAPI.fetchCategory() { [weak self] result in
            switch result {
            case let .success(response):
                
                if let value = response.categories {
                    self?.listCategory = value
                }
                
                self?.viewProtocol?.dismissLoading()
                self?.viewProtocol?.show()
            case .failure:
                self?.viewProtocol?.dismissLoading()
            }
        }
    }
    
    public func getCountCategory() -> Int {
        return self.listCategory.count
    }
    
    public func getCategoryWith(indexPath: Int) -> Category{
        return self.listCategory[indexPath]
    }
}
