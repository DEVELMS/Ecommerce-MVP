//
//  UserDataManager.swift
//  Ecommerce-MVP
//
//  Created by Lucas Soares on 14/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import RealmSwift
import UIKit

final class UserDataManager {
    
    fileprivate var dataBase: Realm?
    
    init() { dataBase = try! Realm() }
}

extension UserDataManager {
    
    func getUser() -> User? {
        
        guard let dataBase = self.dataBase else { return nil }
        
        if let user = dataBase.objects(UserRealm.self).first {
            return parse(userRealm: user)
        }
        
        return nil
    }
    
    func saveUser(user: User) {
        
        guard let dataBase = self.dataBase else { return }
        
        try! dataBase.write {
            dataBase.add(parse(user: user))
        }
    }
}

// MARK: - Private methods 

extension UserDataManager {

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

extension UserDataManager {
    
    fileprivate func parse(userRealm: UserRealm) -> User {
        return User(name: userRealm.name, cardNumber: userRealm.cardNumber, cardYear: userRealm.cardYear, cardMonth: userRealm.cardMonth, cardCvv: userRealm.cardCvv)
    }
    
    fileprivate func parse(user: User) -> UserRealm {
        let userRealm = UserRealm()
        userRealm.name = user.name
        userRealm.cardNumber = user.cardNumber
        userRealm.date = self.currentDate()
        return userRealm
    }
}
