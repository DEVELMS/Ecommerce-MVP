//
//  Request.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 18/09/16.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import Just

final class Request: Requesting {
    
    static let sharedInstance = Request()
    
    func APIRequest(method: HTTPMethod, url: String, parameters: [String : Any]? = nil, success: @escaping (Any) -> Void, failure: @escaping (RequestError) -> Void) {
        
        switch method {
        case .get :
            
            get(to: url, success: {
                result in
                success(result)
            }, failure: {
                error in
                failure(error)
            })
        case .post :
            
            post(to: url, parameters: parameters, success: {
                result in
                success(result)
            }, failure: {
                error in
                failure(error)
            })
            
        default: print("HTTPMethod not supported")
        }
    }
    
    private func get(to: String, success: @escaping (Any) -> Void, failure: @escaping (RequestError) -> Void) {
        
        Just.get(to) {
            r in
            
            if r.ok {
                
                guard let response = r.json else {
                    return print("no json")
                }
                
                Do.now { success(response) }
            }
            else {
                
                guard let code = r.statusCode else {
                    return print("get failure without statusCode")
                }
                
                Do.now { failure(RequestError(code: code)) }
            }
        }
    }
    
    private func post(to: String, parameters: [String : Any]? = nil, success: @escaping (Any) -> Void, failure: @escaping (RequestError) -> Void) {
        
        var parameters_: [String : Any] = [:]
        
        if let parameters = parameters {
            parameters_ = parameters
        }
        
        Just.post(to, params: parameters_) {
            r in
            
            if r.ok {
                
                guard let response = r.json else {
                    return print("no json")
                }
                
                Do.now { success(response) }
            }
            else {
                
                guard let code = r.statusCode else {
                    return print("post failure without statusCode")
                }
                
                Do.now { failure(RequestError(code: code)) }
            }
        }
    }
}
