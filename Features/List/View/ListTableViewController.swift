//
//  ListTableViewController.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 30/07/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    fileprivate lazy var spinner = Loader(size: .larger)
    fileprivate var presenter: ListPresenter?
    fileprivate var sectionHeight = CGFloat(70)
    fileprivate var rowHeight = CGFloat(250)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ListPresenter(view: self)
        presenter?.showList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableLayout()
    }
}

// MARK: - Private methods

extension ListTableViewController {
    
    fileprivate func tableLayout() {
        tableView.tableFooterView = UIView(frame: .zero)
        //tableView.contentInset.top = UIApplication.shared.statusBarFrame.height
    }
    
    func makeHeader(title: String, price: NSNumber) -> UIView {

        let header = UIView()
        header.backgroundColor = .white
        let margins = header.layoutMarginsGuide
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textAlignment = .left
        titleLabel.textColor = .darkGray
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        header.addSubview(titleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 12).isActive = true
        
        let priceLabel = UILabel()
        priceLabel.text = "R$ \(Formatter.moneyFormat(value: price))"
        priceLabel.font = UIFont.boldSystemFont(ofSize: 20)
        priceLabel.textAlignment = .left
        priceLabel.textColor = .black
        priceLabel.adjustsFontSizeToFitWidth = true
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        header.addSubview(priceLabel)
        
        priceLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        
        return header
    }
}

// MARK: - Table view data source

extension ListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        guard let presenter = presenter else {
            fatalError("Presenter cannot be nil.")
        }
        
        return presenter.items.count
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
        
        return makeHeader(title: presenter.items[section].name, price: presenter.items[section].price)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let presenter = presenter else {
            fatalError("Presenter cannot be nil.")
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonCell.identifier, for: indexPath) as! PokemonCell
        cell.item = presenter.items[indexPath.section]
        return cell
    }
}

// MARK: - List view protocol

extension ListTableViewController: ListView {

    func showLoading() {
        spinner.start(on: self.view)
    }
    
    func hideLoading() {
        spinner.stop()
    }
    
    func reloadTableView() {
        UIView.transition(with: tableView,
                          duration: 0.35,
                          options: .transitionCrossDissolve,
                          animations: { self.tableView.reloadData() })
    }
    
    func showAlertError(with title: String, message: String, buttonTitle: String) {
        
    }
}


