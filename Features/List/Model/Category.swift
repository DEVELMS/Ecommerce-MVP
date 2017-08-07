//
//  PageModel.swift
//  NewsNow
//
//  Created by Storm on 07/11/16.
//
//
import Foundation

struct Category {
    
    var id: Int
    var price = NSNumber()
    var name = String()
    var pokemons = [Pokemon]()
    
    init(id: Int, price: NSNumber, name: String, pokemons: [Pokemon]) {
        
        self.id = id
        self.price = price
        self.name = name
        self.pokemons = pokemons
    }
}
