//
//  UserCell.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 15/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    
    var item: UserProfileModel? {
        didSet {
            self.fillOutlets()
        }
    }
}

// MARK: - Private methods

extension UserCell {

    fileprivate func fillOutlets() {
        
        guard let item = self.item else {
            fatalError("Item cannot be nil")
        }
        
        self.name.text = item.name
    }
}
