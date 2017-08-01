//
//  General.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 01/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

enum URLS {
    case list
    case purchase
    
    var url: String {
        switch self {
        case .list: return "https://private-a37d8e-pokestorm.apiary-mock.com/pokemons"
        case .purchase: return "https://private-a37d8e-pokestorm.apiary-mock.com/pokemons"
        }
    }
}

enum Icons {
    case list
    case profile
    
    var image: UIImage {
        switch self {
        case .list: return #imageLiteral(resourceName: "shop-icon")
        case .profile: return #imageLiteral(resourceName: "profile-icon")
        }
    }
}

enum Colors {
    case navigation
    case tabbar(type: TabBarState)
    
    enum TabBarState {
        case selected
        case unselected
        case background
    }
    
    var color: UIColor {
        switch self {
        case .navigation: return UIColor(hexadecimal: 0x000000)
        case .tabbar(let type):
            switch type {
            case .selected: return UIColor(hexadecimal: 0xFFFFFF)
            case .unselected: return UIColor(hexadecimal: 0xF0F0F0)
            case .background: return UIColor(hexadecimal: 0x000000)
            }
        }
    }
}
