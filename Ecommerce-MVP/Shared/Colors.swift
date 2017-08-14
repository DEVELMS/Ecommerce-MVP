//
//  Colors.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 14/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

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
        case .navigation: return UIColor(hexadecimal: 0xf23937)
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
