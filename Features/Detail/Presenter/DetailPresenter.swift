//
//  DetailPresenter.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 10/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

final class DetailPresenter {

    fileprivate unowned let view: DetailViewProtocol
    
    // Storage properties
    fileprivate var item: PokemonDetailModel?
    fileprivate(set) var viewItem: Pokemon?
    
    init(view: DetailViewProtocol) {
        self.view = view
    }
}
