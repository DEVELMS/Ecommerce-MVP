//
//  ModelDetailRouter.swift
//  Ecommerce-MVP
//
//  Created by Lucas Soares on 14/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

struct ModelDetailRouter {
    var pokemon: Pokemon
    var price: String
    
    init(pokemon: Pokemon, price: String) {
        self.pokemon = pokemon
        self.price = price
    }
}
