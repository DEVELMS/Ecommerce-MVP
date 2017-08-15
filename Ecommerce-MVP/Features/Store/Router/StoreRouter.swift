//
//  StoreRouter.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 14/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

final class StoreRouter: StoreRouterProtocol {
    
    func present(at: DetailViewProtocol, with item: DetailedPokemon) {
        
        let storeController = UIStoryboard(name: "Store", bundle: nil).instantiateViewController(withIdentifier: StoreViewController.identifier) as! StoreViewController
        
        let storePresenter = StorePresenter(view: storeController, item: item)
        storeController.presenter = storePresenter
        
        at.presentStoreView(viewController: storeController)
    }
}
