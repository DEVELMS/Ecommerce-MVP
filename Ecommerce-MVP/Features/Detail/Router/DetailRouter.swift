//
//  DetailRouter.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 11/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

final class DetailRouter: DetailRouterProtocol {
    
    func show(from: ListViewProtocol, with: Pokemon, price: String) {
        
        let detailController = UIStoryboard(name: "Detail", bundle: nil).instantiateViewController(withIdentifier: DetailViewController.identifier) as! DetailViewController
        
        let detailPresenter = DetailPresenter(view: detailController, item: with, price: price)
        
        detailController.presenter = detailPresenter
        
        from.showDetailView(viewController: detailController)
    }
}
