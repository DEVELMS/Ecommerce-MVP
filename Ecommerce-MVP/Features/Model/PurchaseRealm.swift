//
//  PurchaseRealm.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 07/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import RealmSwift
import Foundation

class PurchaseRealm: Object {
    
    dynamic var name = ""
    dynamic var price = ""
    dynamic var userName = ""
    dynamic var cardNumber = ""
    dynamic var month = ""
    dynamic var year = ""
    dynamic var date = ""
    dynamic var image: NSData? = nil
}
