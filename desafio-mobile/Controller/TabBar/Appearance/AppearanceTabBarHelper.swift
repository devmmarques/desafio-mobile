//
//  AppearanceTabBarHelper.swift
//  desafio-mobile
//
//  Created by Marco Marques on 24/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import UIKit

struct AppearanceTabBarHelper {
    
    static func customizeNavigationBar() {
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.isTranslucent = false
        navigationBarAppearace.tintColor = .white
        navigationBarAppearace.barTintColor = UIColor.NavigationController.background
        navigationBarAppearace.shadowImage = UIImage.init()
        navigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationBarAppearace.setBackgroundImage(UIImage.init(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
    }
}
