//
//  DetailedPokemon.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 14/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

struct DetailedPokemon {
    let pokemon: Pokemon
    let price: String
    
    init(pokemon: Pokemon, price: String) {
        self.pokemon = pokemon
        self.price = price
    }
}
