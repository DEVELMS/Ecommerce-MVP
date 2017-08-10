//
//  Formatter.swift
//  Helper
//
//  Created by Lucas M. Soares on 01/12/16.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import Foundation

struct Formatter {
    
    enum DateType: String {
        case api = "yyyy-MM-dd"
        case user = "dd/MM/yyyy"
    }
    
    static func convert(date: String, from: DateType) -> String {
        
        let oldFormatter = DateFormatter()
        oldFormatter.dateFormat = from.rawValue
        let oldDate = oldFormatter.date(from: date)
        
        let newFormatter = DateFormatter()
        
        if from == .api { newFormatter.dateFormat = DateType.user.rawValue }
        else { newFormatter.dateFormat = DateType.api.rawValue }
        
        guard let old = oldDate else {
            print("date not valid")
            return date
        }
        
        return newFormatter.string(from: old)
    }
    
    static func removeSpecialChars(string: String) -> String {
        
        let chars = ["-", ".", "(", ")"]
        
        var aux = string
        
        for char in chars {
            
            aux = aux.replacingOccurrences(of: char, with: "")
        }
        
        return aux
    }
    
    static func moneyFormat(value: NSNumber) -> String {
    
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        guard let price = formatter.string(from: value) else { return "\(value)" }
        
        return price
    }
    
    static func currentDate() -> String {
    
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

