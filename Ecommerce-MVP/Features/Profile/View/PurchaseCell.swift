//
//  PokemonCell.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 31/07/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

class PurchaseCell: UITableViewCell {

    @IBOutlet fileprivate weak var purchaseImage: UIImageView!
    @IBOutlet fileprivate weak var purchaseName: UILabel!
    @IBOutlet fileprivate weak var cardNumber: UILabel!
    @IBOutlet fileprivate weak var purchasePrice: UILabel!
    @IBOutlet fileprivate weak var purchaseDate: UILabel!
    
    var item: PurchaseProfileModel? {
        didSet {
            self.fillOutlets()
        }
    }
}

// MARK: - Private methods

extension PurchaseCell {
    
    fileprivate func fillOutlets() {
        
        guard let item = self.item else {
            fatalError("Item cannot be nil")
        }
        
        self.purchaseName.text = item.name
        self.cardNumber.text = item.cardNumber
        self.purchasePrice.text = item.price
        self.purchaseDate.text = item.date
        
        self.purchaseImage.sd_setShowActivityIndicatorView(true)
        self.purchaseImage.sd_setIndicatorStyle(.white)
        self.purchaseImage.sd_setImage(with: URL(string: item.image), placeholderImage: #imageLiteral(resourceName: "placeholder"))
    }
}
