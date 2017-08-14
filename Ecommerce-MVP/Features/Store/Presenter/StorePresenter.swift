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
    fileprivate var nextStep = Steps.firstStep
    
    fileprivate enum Steps: Int {
        case firstStep = 0
        case lastStep = 1
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
        case .firstStep:
            view.showStep1()
            nextStep = .lastStep
        case .lastStep:
            view.showStep2()
        }
    }
}

// MARK: Private Methods

extension StorePresenter {
    
}


