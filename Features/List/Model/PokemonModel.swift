//
//  PokemonModel.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 08/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

struct PokemonModel : PokemonProtocol {
    
    let name: String
    let image: String
    
    init(model: Pokemon) {
        self.name = model.name
        self.image = model.image
    }
}
