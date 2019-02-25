//
//  ProductsViewController.swift
//  desafio-mobile
//
//  Created by Marco Marques on 24/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import UIKit

final class ProductsViewController: UIViewController, UISearchBarDelegate, UISearchControllerDelegate {
    
    // MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
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
        
        configureSearchController()
        configureCollection()
        self.presenter.fetchProducts()
    }
    
    private func configureCollection(){
        self.view.backgroundColor = UIColor.grayBackground
        collectionView.register(UINib(nibName: "ProductViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductViewCell")
        collectionView.addSubview(self.refreshControl)
    }
    
    private func configureSearchController() {
        
        let searchTextField: UITextField? = { [unowned self] in
            var textField: UITextField?
            searchController.searchBar.subviews.forEach({ view in
                view.subviews.forEach({ view in
                    if let view  = view as? UITextField {
                        textField = view
                    }
                })
            })
            return textField
        }()

        if let searchText = searchTextField?.subviews.first {
            searchText.backgroundColor = UIColor.white
            searchText.layer.cornerRadius = 10
            searchText.clipsToBounds = true
        }
        UIBarButtonItem.appearance(whenContainedInInstancesOf:[UISearchBar.self]).tintColor = UIColor.white
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Busca por produtos"
        searchController.searchBar.searchBarStyle = .prominent
        searchController.searchBar.backgroundColor = UIColor.redDefault
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        self.presenter.cleanParameterRequest()
        self.presenter.fetchProducts()
        
    }
}

extension ProductsViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let name = searchBar.text else { return }
        
        if name == ""{
            
        } else if name.count > 3 {
            self.presenter.fetchProducts(name)
        }
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
        self.searchController.searchBar.becomeFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        if let text = searchBar.text {
            if !text.isEmpty {
                self.presenter.cleanParameterRequest()
                self.presenter.fetchProducts()
            }
        }
        searchBar.text = ""
        searchBar.showsCancelButton = false
        searchController.searchBar.sizeToFit()
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
       
        if self.presenter.getTotalProduct() > 10 {
            let lastElement = self.presenter.getCountProduct() - 1
            if indexPath.row == lastElement {
                self.presenter.fetchProducts()
            }
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
        self.searchController.dismiss(animated: false) {
            UIAlertController().dismissLoading(viewController: self)
        }
        UIAlertController().dismissLoading(viewController: self)
    }
    
    func show(error: Error) {
        
    }
    
}
