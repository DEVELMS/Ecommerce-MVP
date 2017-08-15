//
//  StorePresenter.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 14/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

final class StorePresenter {

    fileprivate unowned let view: StoreViewProtocol
    fileprivate let userDataManager = UserDataManager()
    fileprivate let purchaseDataManager = PurchaseDataManager()
    
    // Storage properties
    fileprivate let item: DetailedPokemon
    fileprivate(set) var register: RegisterModelProtocol?
    fileprivate var user: User?
    fileprivate var nextStep = Steps.firstAsking
    
    fileprivate enum Steps {
        case firstAsking
        case secondAsking
        case register
        case creditCard
        case purchase
        case finished
    }
    
    init(view: StoreViewProtocol, item: DetailedPokemon) {
        self.view = view
        self.item = item
    }
}

// MARK: Public Methods

extension StorePresenter {

    func showNextStep() {
    
        if let user = userDataManager.getUser() {
            self.user = user
            view.showPurchaseStep(with: PurchaseStepModel(name: item.pokemon.name, price: item.price, image: item.pokemon.image))
        }
        else {
            switch nextStep {
            case .firstAsking:
                view.showStep1()
                nextStep = .secondAsking
                
            case .secondAsking:
                view.showStep2()
                nextStep = .register
                
            case .register:
                view.showRegisterStep()
                nextStep = .creditCard
                
            case .creditCard:
                view.showCreditCardStep()
                nextStep = .purchase
                
            case .purchase:
                view.showPurchaseStep(with: PurchaseStepModel(name: item.pokemon.name, price: item.price, image: item.pokemon.image))
                nextStep = .finished
                
            case .finished:
                view.purchaseFinished()
            }
        }
    }
    
    func storageRegister(with register: RegisterModel) {
        self.register = register
    }
    
    func registerUser() {
    
        guard let register = self.register else {
            fatalError("User storage cannot be nil")
        }
        
        userDataManager.saveUser(user: User(name: register.userName, cardNumber: register.cardNumber, cardYear: register.cardYear, cardMonth: register.cardMonth, cardCvv: register.cardCvv))
    }
    
    func doTransaction() {
        
        guard let user = self.user else {
            fatalError("User cannot be nil")
        }
        
        let purchaseService = PurchaseService()
        
        let parameters: [String: Any] = [
            "product_id": item.pokemon.id,
            "user": user.name,
            "card_number": user.cardNumber,
            "card_year": user.cardYear,
            "card_month": user.cardMonth,
            "cvv": user.cardCvv
        ]
        
        self.view.showLoading()
        
        purchaseService.makePurchase(with: parameters,
            success: {
                self.registerPurchase()
                self.view.showAlert(with: "Success", message: "Transaction done, your purchase was registered!", buttonTitle: "OK")
                self.view.hideLoading()
            }, fail: {
                message in
                self.view.showAlert(with: "Error", message: message, buttonTitle: "OK")
                self.view.hideLoading()
            }
        )
    }
}

// MARK: Private Methods

extension StorePresenter {
    
    fileprivate func registerPurchase() {
        
        guard let user = self.user else {
            fatalError("User cannot be nil")
        }
        
        purchaseDataManager.savePurchase(with: Purchase(name: item.pokemon.name, price: item.price, cardNumber: user.cardNumber, image: item.pokemon.image))
    }
}


