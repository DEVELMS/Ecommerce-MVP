//
//  ApplicationService.swift
//  Ecommerce-MVP
//
//  Created by Lucas Soares on 07/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

final class KindService {
    
    func parseKinds(json: JSON) -> [Kind] {
        
        var kinds = [Kind]()
        
        for (_, kind) in json {
            
            kinds.append(parse(kind: kind.stringValue))
        }
        
        return kinds
    }
    
    private func parse(kind: String) -> Kind {
        
        return Kind(kind: kind)
    }
}
