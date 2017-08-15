//
//  Purchase.swift
//  PokeCommerce
//
//  Created by Lucas M Soares on 16/12/16.
//  Copyright © 2016 DEVELMS. All rights reserved.
//

struct Purchase {
    
    let name: String
    let price: String
    let cardNumber: String
    let image: String
    
    init(name: String, price: String, cardNumber: String, image: String) {
        
        self.name = name
        self.price = price
        self.cardNumber = cardNumber
        self.image = image
    }
}
