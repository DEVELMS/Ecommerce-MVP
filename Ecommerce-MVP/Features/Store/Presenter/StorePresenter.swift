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
    fileprivate var nextStep = Steps.firstAskingStep
    
    fileprivate enum Steps {
        case firstAskingStep
        case secondAskingStep
        case registerStep
        case creditCardStep
        case purchaseStep
    }
    
    init(view: StoreViewProtocol, router: StoreRouterProtocol, item: Pokemon) {
        self.view = view
//        self.router = router
    }
}

// MARK: Public Methods

extension StorePresenter {

    func showNextStep() {
    
        switch nextStep {
        case .firstAskingStep:
            view.showStep1()
            nextStep = .secondAskingStep
            
        case .secondAskingStep:
            view.showStep2()
            nextStep = .registerStep
            
        case .registerStep:
            view.showRegisterStep()
            nextStep = .creditCardStep
            break
            
        case .creditCardStep:
            view.showCreditCardStep()
            nextStep = .purchaseStep
            break
            
        case .purchaseStep:
            break
        }
    }
}

// MARK: Private Methods

extension StorePresenter {
    
}


