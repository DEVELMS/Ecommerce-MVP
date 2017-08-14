//
//  PageModel.swift
//  Ecommerce-MVP
//
//  Created by Lucas Soares on 07/11/16.
//  Copyright © 2016 DEVELMS. All rights reserved.
//

import Foundation

struct Category {
    
    var id: Int
    var price: String
    var name: String
    var pokemons: [Pokemon]
    
    init(id: Int, price: NSNumber, name: String, pokemons: [Pokemon]) {
        
        self.id = id
        self.name = name
        self.pokemons = pokemons
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        self.price = formatter.string(from: price) ?? ""
    }
}
