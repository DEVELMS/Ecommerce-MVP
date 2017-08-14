//
//  JoyAsking2.swift
//  Ecommerce-MVP
//
//  Created by Lucas Soares on 14/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

class JoyAskingStep2: UIView {
    
    var storeView: StoreViewProtocol?
    
    @IBAction func givingInformationsAccepted(_ sender: UIButton) {
        storeView?.givingInformationsAccepted()
    }
    
    @IBAction func givingInformationsDecline(_ sender: UIButton) {
        storeView?.givingInformationsDeclined()
    }
}
