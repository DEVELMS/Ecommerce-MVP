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
        
        let tabBar = TabBar()
        
        tabBar.setViewControllers([prepareList(), prepareProfile()], animated: true)
        
        window.rootViewController = tabBar
        window.makeKeyAndVisible()
    }
}

extension TabBarRouter {

    fileprivate func prepareList() -> UINavigationController {
        
        let listController = UIStoryboard(name: "List", bundle: nil).instantiateViewController(withIdentifier: ListTableViewController.identifier) as! ListTableViewController
        
        let listPresenter = ListPresenter(view: listController)
        listController.presenter = listPresenter
        
        let listNavigation = UINavigationController(rootViewController: listController)
        
        listNavigation.tabBarItem = UITabBarItem(title: "Shop", image: #imageLiteral(resourceName: "shop-icon"), selectedImage: #imageLiteral(resourceName: "shop-icon"))
        
        return listNavigation
    }
    
    fileprivate func prepareProfile() -> ProfileTableViewController {
        
        let profileController = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: ProfileTableViewController.identifier) as! ProfileTableViewController
        
        profileController.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "profile-icon"), selectedImage: #imageLiteral(resourceName: "profile-icon"))
        
        return profileController
    }
}
