//
//  ListTableViewController.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 30/07/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    fileprivate var sectionHeight = CGFloat(90)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ListTableViewController {

    // MARK: Private methods
    
    func makeHeader(title: String, price: NSNumber) -> UIView {

        let header = UIView()
        header.backgroundColor = .white
 
        let margins = header.layoutMarginsGuide
        
        let title = UILabel()
        title.text = "Sessão"
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.textAlignment = .left
        title.textColor = .darkGray
        title.adjustsFontSizeToFitWidth = true
        title.translatesAutoresizingMaskIntoConstraints = false
        header.addSubview(title)
        
        title.topAnchor.constraint(equalTo: margins.topAnchor, constant:16).isActive = true
        title.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 12).isActive = true
        title.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -12).isActive = true
        
        let price = UILabel()
        price.text = "R$ \(Formatter.moneyFormat(value: 20000))"
        price.font = UIFont.systemFont(ofSize: 15)
        price.textAlignment = .left
        price.textColor = .darkGray
        price.adjustsFontSizeToFitWidth = true
        price.translatesAutoresizingMaskIntoConstraints = false
        header.addSubview(price)
        
        price.leadingAnchor.constraint(equalTo: title.leadingAnchor).isActive = true
        price.trailingAnchor.constraint(equalTo: title.trailingAnchor).isActive = true
        price.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
        
        return header
    }
}

extension ListTableViewController {
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHeight
    }
    
    override internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return makeHeader(title: "Sessão", price: 200000)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonCell.identifier, for: indexPath) as! PokemonCell
        return cell
    }
}

