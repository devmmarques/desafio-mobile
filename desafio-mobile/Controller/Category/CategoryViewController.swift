//
//  CategoryViewController.swift
//  desafio-mobile
//
//  Created by Marco Marques on 24/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import UIKit

final class CategoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate lazy var presenter: CategoryPresenter = {
        let presenter = CategoryPresenter(viewProtocol: self)
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
        self.title = "Categorias"
        self.presenter.fetchCategory()
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        self.presenter.fetchCategory()
    }
    
    func configureTable() {
        tableView.addSubview(self.refreshControl)
    }
    
}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.getCountCategory()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryViewCell", for: indexPath) as! CategoryViewCell
        
        cell.descriptionLabel.text = self.presenter.getCategoryWith(indexPath: indexPath.row).name
        return cell
    }
}


extension CategoryViewController: CategoryProtocol {
    func show() {
        self.tableView.reloadData()
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
