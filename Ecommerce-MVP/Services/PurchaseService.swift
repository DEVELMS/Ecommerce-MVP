//
//  PurchaseService.swift
//  Ecommerce-MVP
//
//  Created by Lucas Soares on 07/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import RealmSwift
import UIKit

final class PurchaseService {
    
    fileprivate var dataBase: Realm?
    fileprivate var purchases: RealmSwift.Results<PurchaseRealm>?
    
    init() { dataBase = try! Realm() }
}

// MARK: - Public methods

extension PurchaseService {
    
    func getPurchases() -> [Purchase] {
        
        guard let dataBase = self.dataBase else { return [Purchase]() }
        
        purchases = dataBase.objects(PurchaseRealm.self).sorted(byKeyPath: "date", ascending: false)
        
        guard let purchases = self.purchases else { return [Purchase]() }
        
        return parsePurchases(purchases: purchases)
    }
    
    func remove(purchase: Purchase) {
        
        guard let dataBase = self.dataBase, let purchaseToDelete = dataBase.objects(PurchaseRealm.self).filter("date = '\(purchase.date)' AND name = '\(purchase.name)'").first else { return }
        
        try! dataBase.write { dataBase.delete(purchaseToDelete) }
    }
    
    func clean() {
        
        guard let dataBase = self.dataBase else { return }
        
        try! dataBase.write { dataBase.deleteAll() }
    }
}

// MARK: - Parses

extension PurchaseService {
    
    fileprivate func parsePurchases(purchases: RealmSwift.Results<PurchaseRealm>) -> [Purchase] {
        
        var parsedPurchases = [Purchase]()
        
        for purchase in purchases {
            
            var parsedPurchase = Purchase(name: purchase.name, price: purchase.price, userName: purchase.userName, cardNumber: purchase.cardNumber, ccv: purchase.ccv, month: purchase.month, year: purchase.year, date: purchase.date)
            
            if let data = purchase.image as Data? {
                parsedPurchase.image = UIImage(data: data)
            }
            
            parsedPurchases.append(parsedPurchase)
        }
        
        return parsedPurchases
    }
}
