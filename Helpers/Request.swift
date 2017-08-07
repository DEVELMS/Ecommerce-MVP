//
//  Request.swift
//  NewsNow
//
//  Created by Lucas M Soares on 18/09/16.
//
//

enum Result<T> {
    
    case success(result: T)
    case failure(error: Int, message: String)
}

protocol Requesting {
    
    //func APIRequest(method: HTTPMethod, url: NSString, success: @escaping (Any) -> Void, failure: @escaping (Int) -> Void)
}

final class Request: Requesting {
    
    static let sharedInstance = Request()
    /*
    func APIRequest(method: HTTPMethod, url: NSString, success: @escaping (Any) -> Void, failure: @escaping (Int) -> Void) {
        
        switch method {
        case .GET :
            
            get(to: url, success: {
                result in
                success(result)
            }, failure: {
                status in
                failure(status)
            })
        case .POST :
            
            post(to: url, success: {
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
    
    private func post(to: String, success: @escaping (Any) -> Void, failure: @escaping (Int) -> Void) {
        
        Just.post(to) {
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
 */
}
