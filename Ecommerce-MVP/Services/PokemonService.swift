//
//  PokemonService.swift
//  Ecommerce-MVP
//
//  Created by Lucas Soares on 07/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import SwiftyJSON

// MARK: - Parses

final class PokemonService {
    
    func parsePokemons(json: [JSON]) -> [Pokemon] {
        return json.flatMap { parsePokemon(json: $0) }
    }
    
    private func parsePokemon(json: JSON) -> Pokemon {
        
        let kindService = KindService()
        
        let id = json["id"].intValue
        let name = json["name"].stringValue
        let types = kindService.parseKinds(json: json["types"].arrayValue)
        let weakness = kindService.parseKinds(json: json["weakness"].arrayValue)
        let description = json["description"].stringValue
        let image = json["image"].stringValue
        
        return Pokemon(id: id, name: name, types: types, weakness: weakness, description: description, image: image)
    }
}
