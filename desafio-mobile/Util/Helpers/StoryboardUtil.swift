//
//  StoryboardUtil.swift
//  desafio-mobile
//
//  Created by Marco Marques on 24/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import UIKit

class StoryboardUtil {
    
    func viewControllerWith(storeBoardName: String, controllerName: String) -> UIViewController{
        let storyboard = UIStoryboard(name: storeBoardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: controllerName)
    }
    
    static func productViewController() -> ProductsViewController {
        let productViewController = StoryboardUtil().viewControllerWith(storeBoardName: "Products", controllerName: "ProductsViewController")
        return  productViewController as! ProductsViewController
    }
    
    static func categoryViewController() -> CategoryViewController {
        let categoryViewController = StoryboardUtil().viewControllerWith(storeBoardName: "Category", controllerName: "CategoryViewController")
        return  categoryViewController as! CategoryViewController
    }
    
    
}
