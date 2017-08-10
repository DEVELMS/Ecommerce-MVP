//
//  RequestProtocol.swift
//  Ecommerce-MVP
//
//  Created by Lucas Soares on 10/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import Just

protocol Requesting {
    
    func APIRequest(method: HTTPMethod, url: String, parameters: [String : Any]?, success: @escaping (Any) -> Void, failure: @escaping (RequestError) -> Void)
}
