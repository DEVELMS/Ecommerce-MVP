//
//  PokemonDetailModel.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 10/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

struct DetailModel {
    
    let name: String
    let image: String
    let background: UIImage
    let types: [UIImage]
    let weakness: [UIImage]
    let description: String
    let price: String
    
    init(name: String, image: String, background: UIImage, types: [UIImage], weakness: [UIImage], description: String, price: String) {
        
        self.name = name
        self.image = image
        self.background = background
        self.types = types
        self.weakness = weakness
        self.description = description
        self.price = price
    }
}
