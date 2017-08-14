//
//  StoreViewController.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 14/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {
    
    var presenter: StorePresenter?
    
    fileprivate lazy var joyAsking1 = Bundle.main.loadNibNamed(JoyAskingStep1.identifier, owner: self, options: nil)?[0] as! JoyAskingStep1
    fileprivate lazy var joyAsking2 = Bundle.main.loadNibNamed(JoyAskingStep2.identifier, owner: self, options: nil)?[0] as! JoyAskingStep2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.showNextStep()
    }
}

// MARK: Private methods

extension StoreViewController {

    fileprivate func addSubviewWithBottomAnchor(with view: UIView) {
        
        let margins = self.view.layoutMarginsGuide
        view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(view)
        self.view.bringSubview(toFront: view)
        
        view.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: -16).isActive = true
        view.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 16).isActive = true
        view.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 8).isActive = true
    }
}

// MARK: Store view protocol

extension StoreViewController: StoreViewProtocol {
    
    func showStep1() {
        joyAsking1.storeView = self
        UIView.transition(with: self.view,
                          duration: 1,
                          options: .transitionFlipFromLeft,
                          animations: {
                            self.addSubviewWithBottomAnchor(with: self.joyAsking1) },
                          completion: nil)
    }
    
    func showStep2() {
        joyAsking2.storeView = self
        UIView.transition(with: self.view,
                          duration: 1,
                          options: .transitionFlipFromLeft,
                          animations: {
                            self.addSubviewWithBottomAnchor(with: self.joyAsking2) },
                          completion: nil)
    }
    
    func jumpToNextStep() {
        self.view.subviews.last?.removeFromSuperview()
        self.presenter?.showNextStep()
    }
    
    func givingInformationsAccepted() {
        
    }
    
    func givingInformationsDeclined() {
        self.dismiss(animated: true, completion: nil)
    }
}
