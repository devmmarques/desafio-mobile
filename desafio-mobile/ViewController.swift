//
//  ViewController.swift
//  desafio-mobile
//
//  Created by Marco Marques on 22/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiClient = ProductService(apiClient: APIClient())
        apiClient.fetchProduct(name: "AirFr") { (response: APIResult<SearchResponse>) in
            switch response {
            case let .success(value):
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }


}

