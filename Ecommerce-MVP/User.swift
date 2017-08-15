//
//  User.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 15/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

struct User {
    
    let name: String
    let cardNumber: String
    let cardYear: String
    let cardMonth: String
    let cardCvv: String
    
    init(name: String, cardNumber: String, cardYear: String, cardMonth: String, cardCvv: String) {
        self.name = name
        self.cardNumber = cardNumber
        self.cardYear = cardYear
        self.cardMonth = cardMonth
        self.cardCvv = cardCvv
    }
}
