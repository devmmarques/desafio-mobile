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
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(self.handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.redDefault
        
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Produtos"
        
        configureCollection()
        
        self.presenter.fetchProducts()
    }
    
    private func configureCollection(){
        self.view.backgroundColor = UIColor.grayBackground
        collectionView.register(UINib(nibName: "ProductViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductViewCell")
        collectionView.addSubview(self.refreshControl)
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        self.presenter.cleanParameterRequest()
        self.presenter.fetchProducts()
        
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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let lastElement = self.presenter.getCountProduct() - 1
        if indexPath.row == lastElement {
            self.presenter.fetchProducts()
        }
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
        if refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
        self.collectionView.reloadData()
    }
    
    func showLoading() {
        UIAlertController().loading(viewController: self)
    }
    
    func dismissLoading() {
        UIAlertController().dismissLoading(viewController: self)
    }
    
    func show(error: Error) {
        
    }
    
}
