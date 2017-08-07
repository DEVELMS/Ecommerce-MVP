//
//  CategoryService.swift
//  Ecommerce-MVP
//
//  Created by Lucas Soares on 07/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

struct CategoryService {
    
    func parseSections(json: JSON) -> [Category] {
        
        var sections = [Category]()
        
        for (_, section) in json {
            
            sections.append(parseSection(json: section))
        }
        
        return sections
    }
    
    private func parseSection(json: JSON) -> Category {
        
        let pokemonService = PokemonService()
        
        let id = json["id"].intValue
        let price = json["price"].numberValue
        let name = json["section"].stringValue
        let pokemons = pokemonService.parsePokemons(json: json["pokemons"])
        
        return Section(id: id, price: price, name: name, pokemons: pokemons)
    }
}
