//
//  PurchaseStepModel.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 15/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

struct PurchaseStepModel {
    let name: String
    let price: String
    let image: String
    
    init(name: String, price: String, image: String) {
        self.name = name
        self.price = price
        self.image = image
    }
}
