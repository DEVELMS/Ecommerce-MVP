//
//  TabBarRouter.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 01/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

final class TabBarRouter {

    static func show(at: UIWindow?) {
        
        guard let window = at else { fatalError("Window cannot be nil") }
        
        let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
        let tabBar = storyboard.instantiateViewController(withIdentifier: "TabBar") as! TabBar
        
        window.rootViewController = tabBar
        window.makeKeyAndVisible()
    }
}
