//
//  RegisterModel.swift
//  Ecommerce-MVP
//
//  Created by Lucas Soares on 14/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

struct RegisterModel: RegisterModelProtocol {
    
    let userName: String
    let cardNumber: String
    let cardMonth: String
    let cardYear: String
    let cardCCVV: String
    
    init(userName: String, cardNumber: String, cardMonth: String, cardYear: String, cardCCVV: String) {
        self.userName = userName
        self.cardNumber = cardNumber
        self.cardMonth = cardMonth
        self.cardYear = cardYear
        self.cardCCVV = cardCCVV
    }
}
