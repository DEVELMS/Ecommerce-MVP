//
//  Request.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 18/09/16.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

final class RequestManager: Requesting {
    
    static let shared = RequestManager()
    
    func APIRequest(method: RequestMethod, url: String, parameters: [String : Any]? = nil, success: @escaping (Any) -> Void, failure: @escaping (RequestError) -> Void) {
        
        let justRequest = JustRequestManager()
        
        switch method {
        case .get :
            
            justRequest.get(to: url, success: {
                result in
                success(result)
            }, failure: {
                error in
                failure(error)
            })
        case .post :
            
            justRequest.post(to: url, parameters: parameters, success: {
                result in
                success(result)
            }, failure: {
                error in
                failure(error)
            })
        }
    }
}
