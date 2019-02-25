//
//  CategoryProtocol.swift
//  desafio-mobile
//
//  Created by Marco Marques on 25/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

protocol CategoryProtocol: AnyObject {
    func show()
    func showLoading()
    func dismissLoading()
    func show(error: Error)
}
