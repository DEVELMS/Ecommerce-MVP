//
//  PokemonModel.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 08/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

final class PokemonModel : PokemonProtocol {
    
    let name: String
    let image: String
    
    var tapAction: (() -> Void)?
    
    init(model: Pokemon, action: (() -> Void)? = nil) {
        self.name = model.name
        self.image = model.image
        self.tapAction = action
    }
}
