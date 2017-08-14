//
//  CategoryModel.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 08/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

struct CategoryModel : CategoryProtocol {
    
    let name: String
    let price: String
    var pokemons: [PokemonProtocol]
    
    init(model: Category) {
        self.name = model.name
        self.price = model.price
        self.pokemons = []
        
        self.pokemons = model.pokemons.flatMap { PokemonModel(model: $0) }
    }
}
