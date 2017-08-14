//
//  ApplicationService.swift
//  Ecommerce-MVP
//
//  Created by Lucas Soares on 07/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import SwiftyJSON

// MARK: - Parses

final class KindService {
    
    func parseKinds(json: [JSON]) -> [Kind] {
        return json.flatMap { parse(kind: $0.stringValue) }
    }
    
    private func parse(kind: String) -> Kind {
        
        return Kind(kind: kind)
    }
}
