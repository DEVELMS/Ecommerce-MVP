//
//  RegisterStep.swift
//  Ecommerce-MVP
//
//  Created by Lucas Soares on 14/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

class RegisterStep: UIView {
    
    @IBOutlet fileprivate weak var name: CustomTextField!
    @IBOutlet weak var cardNumber: CustomTextField!
    @IBOutlet weak var cardMonth: CustomTextField!
    @IBOutlet weak var cardYear: CustomTextField!
    @IBOutlet weak var ccvv: CustomTextField!
    
    var storeView: StoreViewProtocol?
}

// MARK: Actions

extension RegisterStep {

    @IBAction func declineTapped(_ sender: UIButton) {
        storeView?.declined()
    }
    
    @IBAction func confirmTapped(_ sender: UIButton) {
        storeView?.storageInfos(register: RegisterModel(userName: name.text, cardNumber: cardNumber.text, cardMonth: cardNumber.text, cardYear: cardYear.text, cardCCVV: ccvv.text))
    }
}
