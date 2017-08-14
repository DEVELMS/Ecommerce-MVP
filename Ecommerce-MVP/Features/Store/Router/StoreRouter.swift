//
//  StoreRouter.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 14/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

final class StoreRouter {
    
    func present(from: DetailViewProtocol, pokemon with: Pokemon) {
        
        let storeController = UIStoryboard(name: "Store", bundle: nil).instantiateViewController(withIdentifier: StoreViewController.identifier) as! StoreViewController
        
        from.presentStoreView(viewController: storeController)
    }
}
