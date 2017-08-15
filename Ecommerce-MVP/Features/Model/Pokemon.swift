//
//  Pokemon.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 18/09/16.
//  Copyright © 2016 DEVELMS. All rights reserved.
//

struct Pokemon {
    
    let id: Int
    let name: String
    let types: [Kind]
    let weakness: [Kind]
    let description: String
    let image: String
    
    init(id: Int, name: String, types: [Kind], weakness: [Kind], description: String, image: String) {
        
        self.id = id
        self.name = name
        self.types = types
        self.weakness = weakness
        self.description = description
        self.image = image
    }
}
