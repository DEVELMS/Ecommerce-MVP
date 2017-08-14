//
//  DetailViewProtocol.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 10/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

protocol DetailViewProtocol : class {
    
    func fillViewOutlets(item: DetailModel)
    func presentStoreView(viewController: UIViewController)
}
