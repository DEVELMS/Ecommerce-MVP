//
//  PurchaseService.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 15/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

final class PurchaseService {
    
    func makePurchase(with parameters: [String:Any], success: @escaping () -> Void, fail: @escaping (_ error: String) -> Void) {
        
        RequestManager.shared.APIRequest(method: .post, url: UrlApi.transaction.rawValue, parameters: parameters,
            success: { result in
                success()
                                            
            }, failure: { failure in
                fail(failure.description)
            }
        )
    }
}
