//
//  CategoryModel.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 08/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import Foundation

final class CategoryModel : CategoryProtocol {
    
    let name: String
    let price: NSNumber
    var pokemons: [PokemonProtocol]
    
    var pokemonTapAction: (() -> Void)?
    
    init(model: Category, pokemonAction: (() -> Void)? = nil) {
        self.name = model.name
        self.price = model.price
        self.pokemons = []
        for pokemon in model.pokemons {
            self.pokemons.append(PokemonModel(model: pokemon, action: pokemonTapAction))
        }
    }
}

// MARK: - Parse

extension CategoryModel {

    fileprivate func parsePokemons(pokemons: [Pokemon]) -> [PokemonProtocol] {
    
        var pokemonsProtocol: [PokemonProtocol] = []
        
        for pokemon in pokemons {
            pokemonsProtocol.append(PokemonModel(model: pokemon, action: pokemonTapAction))
        }
        
        return pokemonsProtocol
    }
}
