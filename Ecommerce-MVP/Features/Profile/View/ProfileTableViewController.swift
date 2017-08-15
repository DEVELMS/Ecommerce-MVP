//
//  ProfileTableViewController.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 31/07/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    
    var presenter: ProfilePresenter?
    
    fileprivate lazy var spinner = Loader(size: .larger)
    fileprivate let userCellHeight: CGFloat = 300
    fileprivate let sectionHeight: CGFloat = 50
    fileprivate let rowHeight: CGFloat = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.viewWillAppear()
    }
}

// MARK: - Private methods

extension ProfileTableViewController {
    
    fileprivate func tableLayout() {
        tableView.tableFooterView = UIView(frame: .zero)
    }
}

// MARK: - Table view data source

extension ProfileTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        guard let presenter = presenter else {
            fatalError("Presenter cannot be nil.")
        }
        
        return presenter.sectionCount
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let presenter = presenter else {
            fatalError("Presenter cannot be nil.")
        }
        
        if section == 0 {
            return 0
        }
        
        return presenter.viewItems.count
    }
    
    override internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return userCellHeight
        }
        
        return sectionHeight
    }
    
    override internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let presenter = presenter else {
            fatalError("Presenter cannot be nil.")
        }
        
        if section == 0 {
            
            if presenter.sectionCount > 1 {
                
                let header = tableView.dequeueReusableCell(withIdentifier: UserCell.identifier) as! UserCell
                header.item = presenter.viewUser
                return header
            }
            
            let header = tableView.dequeueReusableCell(withIdentifier: "EmptyCell")
            return header
        }
        
        let header = tableView.dequeueReusableCell(withIdentifier: "SectionCell")
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let presenter = presenter else {
            fatalError("Presenter cannot be nil.")
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PurchaseCell.identifier, for: indexPath) as! PurchaseCell
        cell.item = presenter.viewItems[indexPath.row]
        return cell
    }
}

// MARK: - Profile view protocol

extension ProfileTableViewController: ProfileViewProtocol {

    func showLoading() {
        spinner.start(on: self.view)
    }
    
    func hideLoading() {
        spinner.stop()
    }
    
    func reloadTableView() {
        UIView.transition(with: tableView, duration: 0.35, options: .transitionCrossDissolve, animations: { self.tableView.reloadData() })
    }
}
