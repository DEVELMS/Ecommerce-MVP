//
//  RequestProtocol.swift
//  Ecommerce-MVP
//
//  Created by Lucas Soares on 10/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

protocol Requesting {
    
    func APIRequest(method: RequestMethod, url: String, parameters: [String : Any]?, success: @escaping (Any) -> Void, failure: @escaping (RequestError) -> Void)
}
