//
//  Pokemon.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 18/09/16.
//  Copyright © 2016 DEVELMS. All rights reserved.
//

struct Pokemon {
    
    var id = Int()
    var name = String()
    var types = [Kind]()
    var weakness = [Kind]()
    var description = String()
    var image = String()
    
    init(id: Int, name: String, types: [Kind], weakness: [Kind], description: String, image: String) {
        
        self.id = id
        self.name = name
        self.types = types
        self.weakness = weakness
        self.description = description
        self.image = image
    }
}
