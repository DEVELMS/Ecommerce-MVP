//
//  TabBarRouter.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 01/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

final class TabBarRouter {

    func show(at: UIWindow?) {
        
        guard let window = at else { fatalError("Window cannot be nil") }
        
        let tabBar = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TabBar") as! TabBar
        
        let listController = UIStoryboard(name: "List", bundle: nil).instantiateViewController(withIdentifier: ListTableViewController.identifier) as! ListTableViewController
        
        listController.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "shop-icon"), selectedImage: #imageLiteral(resourceName: "shop-icon"))
        
        let profileController = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: ProfileTableViewController.identifier) as! ProfileTableViewController
        
        profileController.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "profile-icon"), selectedImage: #imageLiteral(resourceName: "profile-icon"))
        
        tabBar.setViewControllers([listController, profileController], animated: true)
        
        window.rootViewController = tabBar
        window.makeKeyAndVisible()
    }
}
