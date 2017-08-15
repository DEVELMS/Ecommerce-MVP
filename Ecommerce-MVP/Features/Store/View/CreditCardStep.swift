//
//  CreditCardView.swift
//  Ecommerce-MVP
//
//  Created by Lucas Soares on 14/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

class CreditCardStep: UIView {

    @IBOutlet fileprivate weak var cardNumber: UILabel!
    @IBOutlet fileprivate weak var cvv: UILabel!
    @IBOutlet fileprivate weak var cardMonth: UILabel!
    @IBOutlet fileprivate weak var cardYear: UILabel!
    @IBOutlet fileprivate weak var userName: UILabel!
    
    var storeView: StoreViewProtocol?
    
    var viewItem: RegisterModelProtocol? {
        didSet {
            self.fillOutlets()
        }
    }
}

// MARK: - Private methods

extension CreditCardStep {

    func fillOutlets() {
    
        guard let item = viewItem else {
            fatalError("View item cannot be nil")
        }
        
        self.cardNumber.text = item.cardNumber
        self.cvv.text = item.cardCvv
        self.cardMonth.text = item.cardMonth
        self.cardYear.text = item.cardYear
        self.userName.text = item.userName
    }
}

// MARK: - Actions

extension CreditCardStep {
    
    @IBAction func declineTapped(_ sender: UIButton) {
        storeView?.declined()
    }
    
    @IBAction func confirmTapped(_ sender: UIButton) {
        storeView?.saveRegister()
    }
}
