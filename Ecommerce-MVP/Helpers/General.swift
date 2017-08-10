//
//  General.swift
//  Helper
//
//  Created by Lucas M Soares on 01/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

enum URL: String {
    case list = "https://private-a37d8e-pokestorm.apiary-mock.com/pokemons"
    case transaction = "https://private-57eb9b-transaction7.apiary-mock.com/poke_transaction"
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
    case section
    
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
            case .unselected: return UIColor(hexadecimal: 0x999999)
            case .background: return UIColor(hexadecimal: 0x000000)
            }
        case .section: return UIColor(hexadecimal: 0xC81510)
        }
    }
}
