//
//  ProductViewCell.swift
//  desafio-mobile
//
//  Created by Marco Marques on 24/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import UIKit

final class ProductViewCell: UICollectionViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var percentOffLabel: UILabel!
    @IBOutlet weak var favoriteImage: UIImageView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var priceOldLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var pricePlotsLabel: UILabel!
    
    func configure(produts: Products) {
        self.productDescription.text = produts.name
        
        if let sku = produts.skus.first {
            if let seller = sku.sellers.first {
                configurePrice(seller: seller)
            }
            
            if let image = sku.images.first, let imageUrl = image.imageUrl{
                self.productImage.imageFromURL(urlString: imageUrl)
            }
        }
    }
    
    private func configurePrice(seller: Sellers) {
        self.priceOldLabel.text = String(format: "R$%.02f", seller.price)
        self.priceLabel.text = String(format: "R$%.02f", seller.listPrice)
        
        if let bestInstallment = seller.bestInstallment {
           self.pricePlotsLabel.text = "\(bestInstallment.count)x de \(String(format: "R$%.02f", bestInstallment.value))"
        }
        
        if let offer = seller.offer {
            self.percentOffLabel.isHidden = false
            self.percentOffLabel.text = "\(offer)% OFF"
        } else {
            self.percentOffLabel.isHidden = true
        }
    }
    
}
