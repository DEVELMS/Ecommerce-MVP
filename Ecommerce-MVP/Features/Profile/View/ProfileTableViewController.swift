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
        customLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.customLayout()
    }
}

extension ProfileTableViewController {

    func customLayout() {
        self.tabBarController?.tabBar.isHidden = false
    }
}

// MARK: - Table view data source

extension ProfileTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
}
