//
//  PurchaseStep.swift
//  Ecommerce-MVP
//
//  Created by Lucas Soares on 14/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

class PurchaseStep: UIView {

    @IBOutlet fileprivate weak var purchaseImage: UIImageView!
    @IBOutlet fileprivate weak var purchaseName: UILabel!
    @IBOutlet fileprivate weak var purchasePrice: UILabel!
    
    var storeView: StoreViewProtocol?
    
    var item: PurchaseStepModel? {
        didSet {
            self.fillOutlets()
        }
    }
}

// MARK: Private Methods

extension PurchaseStep {
    
    fileprivate func fillOutlets() {
        
        guard let item = self.item else {
            fatalError("Item cannot be nil")
        }
        
        self.purchaseName.text = item.name
        self.purchasePrice.text = item.price
        
        self.purchaseImage.sd_setShowActivityIndicatorView(true)
        self.purchaseImage.sd_setIndicatorStyle(.white)
        self.purchaseImage.sd_setImage(with: URL(string: item.image), placeholderImage: #imageLiteral(resourceName: "placeholder"))
    }
}

// MARK: Actions

extension PurchaseStep {

    @IBAction func decline(_ sender: UIButton) {
        storeView?.declined()
    }
    
    @IBAction func confirm(_ sender: UIButton) {
        storeView?.purchaseFinished()
    }
}
