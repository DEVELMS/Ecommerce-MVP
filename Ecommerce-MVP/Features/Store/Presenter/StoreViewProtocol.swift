//
//  StoreViewProtocol.swift
//  Ecommerce-MVP
//
//  Created by Lucas Soares on 14/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

protocol StoreViewProtocol : class {

    func showStep1()
    func showStep2()
    func showRegisterStep()
    func showCreditCardStep()
    func showPurchaseStep(with: PurchaseStepModel)
    func saveRegister()
    func purchaseFinished()
    func jumpToNextStep()
    func declined()
    func showLoading()
    func hideLoading()
    func storageInfos(register: RegisterModel)
    func showAlert(with title: String, message: String, buttonTitle: String)
}
