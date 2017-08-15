//
//  DetailRouterProtocol.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 11/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

protocol DetailRouterProtocol: class {
    
    func show(from: ListViewProtocol, with: Pokemon, price: String)
    func presentStore(with item: DetailedPokemon)
}
