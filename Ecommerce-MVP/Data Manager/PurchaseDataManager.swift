//
//  PurchaseDataManager.swift
//  Ecommerce-MVP
//
//  Created by Lucas Soares on 07/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import RealmSwift
import UIKit

final class PurchaseDataManager {
    
    fileprivate var dataBase: Realm?
    
    init() { dataBase = try! Realm() }
}

// MARK: - Public methods

extension PurchaseDataManager {
    
    func getPurchases() -> [PurchaseProfileModel] {
        
        guard let dataBase = self.dataBase else { return [PurchaseProfileModel]() }
        
        let purchases = dataBase.objects(PurchaseRealm.self).sorted(byKeyPath: "date", ascending: false)
        
        return parse(with: purchases)
    }
    
    func savePurchase(with purchase: Purchase) {
        
        guard let dataBase = self.dataBase else { return }
        
        try! dataBase.write {
            dataBase.add(parse(with: purchase))
        }
    }
}

// MARK: - Private methods

extension PurchaseDataManager {
    
    fileprivate func currentDate() -> String {
        
        let date = Date()
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        
        return "\(day)/\(month)/\(year) - \(hour):\(minutes):\(seconds)"
    }
}

// MARK: - Parses

extension PurchaseDataManager {
    
    fileprivate func parse(with purchases: RealmSwift.Results<PurchaseRealm>) -> [PurchaseProfileModel] {
        
        return purchases.flatMap { PurchaseProfileModel(name: $0.name, price: $0.price, cardNumber: $0.cardNumber, image: $0.image, date: $0.date) }
    }
    
    fileprivate func parse(with purchase: Purchase) -> PurchaseRealm {
        
        let purchaseRealm = PurchaseRealm()
        purchaseRealm.name = purchase.name
        purchaseRealm.price = purchase.price
        purchaseRealm.cardNumber = purchase.cardNumber
        purchaseRealm.date = self.currentDate()
        purchaseRealm.image = purchase.image
        
        return purchaseRealm
    }
}
