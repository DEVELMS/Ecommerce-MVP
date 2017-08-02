//
//  ListTableViewController.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 30/07/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ListTableViewController {

    // MARK: - Table view data source
    //listSection
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: PokemonCell.identifier, for: indexPath) as! PokemonCell
        
        return UITableViewCell()
    }
}


