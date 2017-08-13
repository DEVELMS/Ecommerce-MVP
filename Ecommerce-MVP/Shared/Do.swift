//
//  Do.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 01/11/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

import Foundation

struct Do {
    
    static func wait(seconds: Double, completion: @escaping () -> Void) {
        
        let time = DispatchTime.now() + seconds
        
        DispatchQueue.main.asyncAfter(deadline: time) {
            
            completion()
        }
    }
    
    static func now(completion: @escaping () -> Void) {
    
        DispatchQueue.main.async {
            
            completion()
        }
    }
}
