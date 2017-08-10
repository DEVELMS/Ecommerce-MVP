//
//  CategoryProtocol.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 08/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import Foundation

protocol CategoryProtocol {
    
    var name: String { get }
    var price: NSNumber { get }
    var pokemons: [PokemonProtocol] { get }
}
