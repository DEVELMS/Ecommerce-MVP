//
//  Kind.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 13/12/16.
//  Copyright © 2016 DEVELMS. All rights reserved.
//

import UIKit

struct Kind {
    
    var option: Option
    
    enum Option {
        
        case normal
        case grass
        case fire
        case water
        case fighting
        case flying
        case poison
        case ground
        case rock
        case bug
        case ghost
        case electric
        case pyschic
        case ice
        case dragon
        case dark
        case steel
        case fairy
        
        var name: String {
        
            switch self {
            case .normal: return "Normal"
            case .grass: return "Grass"
            case .fire: return "Fire"
            case .water: return "Water"
            case .fighting: return "Fighting"
            case .flying: return "Flying"
            case .poison: return "Poison"
            case .ground: return "Ground"
            case .rock: return "Rock"
            case .bug: return "Bug"
            case .ghost: return "Ghost"
            case .electric: return "Electric"
            case .pyschic: return "Psychic"
            case .ice: return "Ice"
            case .dragon: return "Dragon"
            case .dark: return "Dark"
            case .steel: return "Steel"
            case .fairy: return "Fairy"
            }
        }
        
        var image: UIImage {
        
            switch self {
            case .normal: return sprite(position: CGPoint(x: 5, y: 20))
            case .grass: return sprite(position: CGPoint(x: 5, y: 150))
            case .fire: return sprite(position: CGPoint(x: 5, y: 280))
            case .water: return sprite(position: CGPoint(x: 5, y: 410))
            case .fighting: return sprite(position: CGPoint(x: 5, y: 535))
            case .flying: return sprite(position: CGPoint(x: 5, y: 660))
            case .poison: return sprite(position: CGPoint(x: 5, y: 785))
            case .ground: return sprite(position: CGPoint(x: 5, y: 915))
            case .rock: return sprite(position: CGPoint(x: 5, y: 1040))
            case .bug: return sprite(position: CGPoint(x: 5, y: 1165))
            case .ghost: return sprite(position: CGPoint(x: 5, y: 1295))
            case .electric: return sprite(position: CGPoint(x: 5, y: 1415))
            case .pyschic: return sprite(position: CGPoint(x: 5, y: 1545))
            case .ice: return sprite(position: CGPoint(x: 5, y: 1670))
            case .dragon: return sprite(position: CGPoint(x: 5, y: 1800))
            case .dark: return sprite(position: CGPoint(x: 5, y: 1930))
            case .steel: return sprite(position: CGPoint(x: 5, y: 2055))
            case .fairy: return sprite(position: CGPoint(x: 5, y: 2185))
            }
        }
        
        private func sprite(position: CGPoint) -> UIImage {
            
            let widthToCroop = CGFloat(335)
            let heightToCroop = CGFloat(120)
            
            let contextImage = #imageLiteral(resourceName: "types")
            let cropRect = CGRect(x: position.x, y: position.y, width: widthToCroop, height: heightToCroop)
            let imageRef: CGImage = contextImage.cgImage!.cropping(to: cropRect)!
            let image = UIImage(cgImage: imageRef, scale: contextImage.scale, orientation: contextImage.imageOrientation)
            
            return image
        }
    }
    
    init(kind: String) {
        
        switch kind {
        case "Normal": option = Option.normal
        case "Grass": option = Option.grass
        case "Fire": option = Option.fire
        case "Water": option = Option.water
        case "Fighting": option = Option.fighting
        case "Flying": option = Option.flying
        case "Poison": option = Option.poison
        case "Ground": option = Option.ground
        case "Rock": option = Option.rock
        case "Bug": option = Option.bug
        case "Ghost": option = Option.ghost
        case "Electric": option = Option.electric
        case "Psychic": option = Option.pyschic
        case "Ice": option = Option.ice
        case "Dragon": option = Option.dragon
        case "Dark": option = Option.dark
        case "Steel": option = Option.steel
        case "Fairy": option = Option.fairy
        default: fatalError("Invalid kind, please check the option enum.")
        }
    }
}
