//
//  UserRealm.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 15/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import RealmSwift
import Foundation

class UserRealm: Object {
    
    dynamic var name = ""
    dynamic var cardNumber = ""
    dynamic var cardYear = ""
    dynamic var cardMonth = ""
    dynamic var cardCvv = ""
    dynamic var date = ""
}
