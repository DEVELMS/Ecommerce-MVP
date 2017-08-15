//
//  PurchaseProfileModel.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 15/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

struct PurchaseProfileModel {
    
    let name: String
    let price: String
    let cardNumber: String
    let image: String
    let date: String
    
    init(name: String, price: String, cardNumber: String, image: String, date: String) {
        
        self.name = name
        self.price = price
        self.cardNumber = cardNumber
        self.image = image
        self.date = date
    }
}
