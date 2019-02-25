//
//  ProductsProtocol.swift
//  desafio-mobile
//
//  Created by Marco Marques on 24/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

protocol ProductsProtocol: AnyObject {
    func show()
    func showLoading()
    func dismissLoading()
    func show(error: Error)
}
