//
//  ListTableViewController.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 30/07/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var presenter: ListPresenter?
    fileprivate var rowHeight = CGFloat(250)
    fileprivate var sectionHeight = CGFloat(50)
    fileprivate lazy var spinner = Loader(size: .larger)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.showList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationBarLayout()
        tableLayout()
        customLayout()
    }
}

// MARK: - Private methods

extension ListTableViewController {
    
    fileprivate func customLayout() {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    fileprivate func navigationBarLayout() {
        
        self.navigationItem.title = "Póke-Shop"
        self.navigationController?.navigationBar.barTintColor = Colors.navigation.color
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "PokemonSolidNormal", size: 25) ?? UIFont.boldSystemFont(ofSize: 25), NSForegroundColorAttributeName: UIColor.white];
    }
    
    fileprivate func tableLayout() {
        tableView.tableFooterView = UIView(frame: .zero)
    }
}

// MARK: - Table view data source

extension ListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        guard let presenter = presenter else {
            fatalError("Presenter cannot be nil.")
        }
        
        return presenter.viewItems.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHeight
    }
    
    override internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let presenter = presenter else {
            fatalError("Presenter cannot be nil.")
        }
        
        let header = tableView.dequeueReusableCell(withIdentifier: SectionCell.identifier) as! SectionCell
        header.item = presenter.viewItems[section]
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let presenter = presenter else {
            fatalError("Presenter cannot be nil.")
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonCell.identifier, for: indexPath) as! PokemonCell
        cell.listView = self
        cell.section = indexPath.section
        cell.item = presenter.viewItems[indexPath.section]
        return cell
    }
}

// MARK: - List view protocol

extension ListTableViewController: ListViewProtocol {

    func showLoading() {
        spinner.start(on: self.view)
    }
    
    func hideLoading() {
        spinner.stop()
    }
    
    func reloadTableView() {
        UIView.transition(with: tableView, duration: 0.35, options: .transitionCrossDissolve, animations: { self.tableView.reloadData() })
    }
    
    func itemSelected(at: IndexPath) {
        presenter?.itemSelected(section: at.section, row: at.row)
    }
    
    func showDetailView(viewController: UIViewController) {
        self.navigationController?.show(viewController, sender: nil)
    }
    
    func showAlertError(with title: String, message: String, buttonTitle: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}


