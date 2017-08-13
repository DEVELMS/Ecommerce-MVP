//
//  SectionCell.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 12/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

class SectionCell: UITableViewCell {
    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var price: UILabel!

    var item: CategoryProtocol? {
        didSet {
            self.fillOutlets()
        }
    }
}

extension SectionCell {
    
    fileprivate func fillOutlets() {
        
        guard let item = item else { fatalError("Item cannot be nil") }
        
        self.sectionTitle.text = item.name
        self.price.text = Formatter.moneyFormat(value: item.price)
    }
}
