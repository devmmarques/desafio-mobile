//
//  ProductNavigationViewController.swift
//  desafio-mobile
//
//  Created by Marco Marques on 24/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import UIKit

public class ProductNavigationViewController: UINavigationController {
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        AppearanceTabBarHelper.customizeNavigationBar()
        self.pushViewController(StoryboardUtil.productViewController(), animated: true)
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
