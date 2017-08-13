//
//  CategoryService.swift
//  Ecommerce-MVP
//
//  Created by Lucas Soares on 07/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import SwiftyJSON

final class CategoryService {
    
    func getCategories(success: @escaping (_ categories: [Category]) -> Void, fail: @escaping (_ error: String) -> Void) {
        
        RequestManager.shared.APIRequest(method: .get, url: UrlApi.list.rawValue,
            success: { result in
                
                success(self.parseCategories(json: JSON(result)))
                
            }, failure: { failure in
            
                fail(failure.description)
            })
    }
}

// MARK: - Parses

extension CategoryService {
    
    fileprivate func parseCategories(json: JSON) -> [Category] {
        
        var categories = [Category]()
        
        for (_, category) in json {
            
            categories.append(parseCategory(json: category))
        }
        
        return categories
    }
    
    private func parseCategory(json: JSON) -> Category {
        
        let id = json["id"].intValue
        let price = json["price"].numberValue
        let name = json["section"].stringValue
        let pokemons = PokemonService().parsePokemons(json: json["pokemons"])
        
        return Category(id: id, price: price, name: name, pokemons: pokemons)
    }
}
