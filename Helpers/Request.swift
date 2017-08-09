//
//  Request.swift
//  NewsNow
//
//  Created by Lucas M Soares on 18/09/16.
//
//

import Just

enum Result<T> {
    
    case success(result: T)
    case failure(error: Int, message: String)
}

protocol Requesting {
    
    func APIRequest(method: HTTPMethod, url: String, parameters: [String : Any]?, success: @escaping (Any) -> Void, failure: @escaping (Int) -> Void)
}

final class Request: Requesting {
    
    static let sharedInstance = Request()
    
    func APIRequest(method: HTTPMethod, url: String, parameters: [String : Any]? = nil, success: @escaping (Any) -> Void, failure: @escaping (Int) -> Void) {
        
        switch method {
        case .get :
            
            get(to: url, success: {
                result in
                success(result)
            }, failure: {
                status in
                failure(status)
            })
        case .post :
            
            var parameters_: [String : Any] = [:]
            
            if let parameters = parameters {
                parameters_ = parameters
            }
            
            post(to: url, parameters: parameters_, success: {
                result in
                success(result)
            }, failure: {
                status in
                failure(status)
            })
            
        default: print("HTTPMethod not supported")
        }
    }
    
    private func get(to: String, success: @escaping (Any) -> Void, failure: @escaping (Int) -> Void) {
        
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
                
                Do.now { failure(code) }
            }
        }
    }
    
    private func post(to: String, parameters: [String : Any], success: @escaping (Any) -> Void, failure: @escaping (Int) -> Void) {
        
        Just.post(to, params: parameters) {
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
                
                Do.now { failure(code) }
            }
        }
    }
}
