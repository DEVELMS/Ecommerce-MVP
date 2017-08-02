//
//  ProfileTableViewController.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 31/07/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ProfileTableViewController {

    // MARK: - Table view data source -
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
}
