//
//  AppDelegate.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 30/07/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        TabBarRouter().show(at: self.window)
        
        return true
    }
}
