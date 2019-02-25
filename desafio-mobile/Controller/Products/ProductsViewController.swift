//
//  ProductsViewController.swift
//  desafio-mobile
//
//  Created by Marco Marques on 24/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import UIKit

final class ProductsViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate lazy var presenter: ProductsPresenter = {
        let presenter = ProductsPresenter(viewProtocol: self)
        return presenter
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Produtos"
        
        configureCollection()
        
        self.presenter.fetchProducts(name: "fritadeira")
    }
    
    private func configureCollection(){
        collectionView.register(UINib(nibName: "ProductViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductViewCell")
    }
}

extension ProductsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.getCountProduct()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductViewCell", for: indexPath) as! ProductViewCell
        cell.configure(produts: self.presenter.getProduct(index: indexPath.row))
        return cell
    }
}

extension ProductsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  10
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize/2, height: 310)
    }
}

extension ProductsViewController: ProductsProtocol {
    func show() {
        self.collectionView.reloadData()
    }
    
    func showLoading() {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
    func dismissLoading() {
        dismiss(animated: true, completion: nil)
    }
    
    func show(error: Error) {
        
    }
    
    
    
    
}
