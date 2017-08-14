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
    func jumpToNextStep()
    func givingInformationsAccepted()
    func givingInformationsDeclined()
}
