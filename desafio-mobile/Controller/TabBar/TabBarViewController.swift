//
//  TabBarViewController.swift
//  desafio-mobile
//
//  Created by Marco Marques on 24/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    let searchProducsViewController = ProductNavigationViewController()
    let categoryViewController = CategoryNavigationViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        configureAppearanceTabBar()
        configureTabBarItens()
        
        searchProducsViewController.view.backgroundColor = UIColor.grayBackground
        categoryViewController.view.backgroundColor = .gray
    }
    
    private func configureAppearanceTabBar() {
        UITabBar.appearance().tintColor = UIColor.NavBar.NavItem.selectedItem
        view.backgroundColor = .white
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.NavBar.NavItem.selectedItem], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.NavBar.NavItem.unselectItem], for: .normal)
    }
    
    private func configureTabBarItens() {
        let tabBarProduct = UITabBarItem(title: "Product", image: UIImage(named: "iconTabHomeGray"), tag: 0)
        tabBarProduct.imageInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        tabBarProduct.accessibilityLabel = "Product"
        tabBarProduct.accessibilityIdentifier = "tabbar-product"
        searchProducsViewController.tabBarItem = tabBarProduct
        
        let tabBarCategory = UITabBarItem(title: "Vitríne", image: UIImage(named: "iconTabCategoryGray"), tag: 1)
        tabBarCategory.imageInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        tabBarCategory.accessibilityLabel = "Category"
        tabBarCategory.accessibilityIdentifier = "tabar-showcase"
        categoryViewController.tabBarItem = tabBarCategory
        
        viewControllers = [searchProducsViewController,
                           categoryViewController]
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    
    
    
}


extension UITabBarItem {
    convenience init(image: UIImage?) {
        self.init(title: nil, image: image, selectedImage: nil)
    }
}
