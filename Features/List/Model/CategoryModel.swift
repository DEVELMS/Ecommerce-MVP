//
//  CategoryModel.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 08/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import Foundation

struct CategoryModel : CategoryProtocol {
    
    let name: String
    let price: NSNumber
    var pokemons: [PokemonProtocol]
    
    init(model: Category) {
        self.name = model.name
        self.price = model.price
        self.pokemons = []
        for pokemon in model.pokemons {
            self.pokemons.append(PokemonModel(model: pokemon))
        }
    }
}

// MARK: - Parse

extension CategoryModel {

    fileprivate func parsePokemons(pokemons: [Pokemon]) -> [PokemonProtocol] {
    
        var pokemonsProtocol: [PokemonProtocol] = []
        
        for pokemon in pokemons {
            pokemonsProtocol.append(PokemonModel(model: pokemon))
        }
        
        return pokemonsProtocol
    }
}
