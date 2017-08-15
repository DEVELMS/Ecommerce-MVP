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
    
    fileprivate lazy var joyAsking1View = Bundle.main.loadNibNamed(JoyAskingStep1.identifier, owner: self, options: nil)?[0] as! JoyAskingStep1
    fileprivate lazy var joyAsking2View = Bundle.main.loadNibNamed(JoyAskingStep2.identifier, owner: self, options: nil)?[0] as! JoyAskingStep2
    fileprivate lazy var registerView = Bundle.main.loadNibNamed(RegisterStep.identifier, owner: self, options: nil)?[0] as! RegisterStep
    fileprivate lazy var creditCardView = Bundle.main.loadNibNamed(CreditCardStep.identifier, owner: self, options: nil)?[0] as! CreditCardStep
    fileprivate lazy var purchaseView = Bundle.main.loadNibNamed(PurchaseStep.identifier, owner: self, options: nil)?[0] as! PurchaseStep
    fileprivate lazy var spinner = Loader(size: .larger)
    
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
        
        view.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: -16).isActive = true
        view.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 16).isActive = true
        view.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }
    
    fileprivate func addSubviewWithTopAnchor(with view: UIView) {
        
        let margins = self.view.layoutMarginsGuide
        view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(view)
        
        view.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: -16).isActive = true
        view.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 16).isActive = true
        view.topAnchor.constraint(equalTo: margins.topAnchor, constant: 58).isActive = true
        view.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }
    
    fileprivate func addSubviewWithFullView(with view: UIView) {
        
        let margins = self.view.layoutMarginsGuide
        view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(view)
        
        view.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: -16).isActive = true
        view.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 16).isActive = true
        view.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }
}

// MARK: Store view protocol

extension StoreViewController: StoreViewProtocol {
    
    func jumpToNextStep() {
        self.view.subviews.last?.removeFromSuperview()
        self.presenter?.showNextStep()
    }
    
    func showStep1() {
        joyAsking1View.storeView = self
        UIView.transition(with: self.view,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.addSubviewWithBottomAnchor(with: self.joyAsking1View) },
                          completion: nil)
    }
    
    func showStep2() {
        joyAsking2View.storeView = self
        UIView.transition(with: self.view,
                          duration: 0.5,
                          options: .transitionFlipFromLeft,
                          animations: {
                            self.addSubviewWithBottomAnchor(with: self.joyAsking2View) },
                          completion: nil)
    }
    
    func showRegisterStep() {
        registerView.storeView = self
        UIView.transition(with: self.view,
                          duration: 0.5,
                          options: .transitionFlipFromLeft,
                          animations: {
                            self.addSubviewWithTopAnchor(with: self.registerView) },
                          completion: nil)
    }
    
    func showCreditCardStep() {
        creditCardView.storeView = self
        creditCardView.viewItem = presenter?.register
        UIView.transition(with: self.view,
                          duration: 0.5,
                          options: .transitionFlipFromLeft,
                          animations: {
                            self.addSubviewWithFullView(with: self.creditCardView) },
                          completion: nil)
    }
    
    func showPurchaseStep(with item: PurchaseStepModel) {
        purchaseView.storeView = self
        purchaseView.item = item
        UIView.transition(with: self.view,
                          duration: 0.5,
                          options: .transitionFlipFromLeft,
                          animations: {
                            self.addSubviewWithTopAnchor(with: self.purchaseView) },
                          completion: nil)
    }
    
    func declined() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func storageInfos(register: RegisterModel) {
        self.presenter?.storageRegister(with: register)
        jumpToNextStep()
    }
    
    func saveRegister() {
        self.presenter?.registerUser()
        jumpToNextStep()
    }
    
    func purchaseFinished() {
        self.presenter?.doTransaction()
    }
    
    func showLoading() {
        spinner.start(on: self.view)
    }
    
    func hideLoading() {
        spinner.stop()
    }
    
    func showAlert(with title: String, message: String, buttonTitle: String) {
    
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .destructive, handler:  {
            _ in
            self.declined()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
