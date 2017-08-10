//
//  TabBar.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 31/07/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabbarAttributes()
    }
}


// MARK: - Private Methods

extension TabBar {
    
    fileprivate func setTabbarAttributes() {
    
        self.tabBar.barTintColor = Colors.tabbar(type: .background).color
        self.tabBar.tintColor = Colors.tabbar(type: .selected).color
        
        if #available(iOS 10.0, *) {
            self.tabBar.unselectedItemTintColor = Colors.tabbar(type: .unselected).color
        }
    }
}
