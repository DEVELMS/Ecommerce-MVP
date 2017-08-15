//
//  RegisterStep.swift
//  Ecommerce-MVP
//
//  Created by Lucas Soares on 14/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

class RegisterStep: UIView {
    
    @IBOutlet fileprivate weak var name: UITextField!
    @IBOutlet fileprivate weak var cardNumber: UITextField!
    @IBOutlet fileprivate weak var cardMonth: UITextField!
    @IBOutlet fileprivate weak var cardYear: UITextField!
    @IBOutlet fileprivate weak var cvv: UITextField!
    
    var storeView: StoreViewProtocol?
}

// MARK: Actions

extension RegisterStep {

    @IBAction func declineTapped(_ sender: UIButton) {
        storeView?.declined()
    }
    
    @IBAction func confirmTapped(_ sender: UIButton) {
        storeView?.storageInfos(register: RegisterModel(userName: name.text ?? "", cardNumber: cardNumber.text ?? "", cardMonth: cardMonth.text ?? "", cardYear: cardYear.text ?? "", cardCvv: cvv.text ?? ""))
    }
}
