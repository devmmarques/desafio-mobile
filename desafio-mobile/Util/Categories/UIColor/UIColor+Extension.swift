//
//  UIColor+Extension.swift
//  desafio-mobile
//
//  Created by Marco Marques on 24/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hex:Int) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff)
    }
}

extension UIColor {
    
    static let grayBackground = UIColor(hex: 0xe6e6e6)
    static let redDefault = UIColor(hex: 0xff3333)
    
    struct NavBar {
        static let background = UIColor(hex: 0xf2f2f2)
        
        struct NavItem {
            static let selectedItem = UIColor(hex: 0xff471a)
            static let unselectItem = UIColor(hex: 0x666666)
        }
    }
    
    struct NavigationController {
        static let background = UIColor(hex: 0xff3300)
        static let textColor = UIColor.white
    }
}
