//
//  RegisterModelProtocol.swift
//  Ecommerce-MVP
//
//  Created by Lucas Soares on 14/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

protocol RegisterModelProtocol {
    var userName: String { get }
    var cardNumber: String { get }
    var cardMonth: String { get }
    var cardYear: String { get }
    var cardCvv: String { get }
}
