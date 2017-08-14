//
//  CreditCardView.swift
//  Ecommerce-MVP
//
//  Created by Lucas Soares on 14/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

class CreditCardStep: UIView {

    var storeView: StoreViewProtocol?
    
    var viewItem: RegisterModelProtocol? {
        didSet {
            self.fillOutlets()
        }
    }
}

// MARK: Private methods

extension CreditCardStep {

    func fillOutlets() {
    
    }
}

// MARK: Actions

extension CreditCardStep {
    
    @IBAction func declineTapped(_ sender: UIButton) {
        storeView?.declined()
    }
    
    @IBAction func confirmTapped(_ sender: UIButton) {
        
    }
}
