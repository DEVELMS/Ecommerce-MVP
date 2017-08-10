//
//  ListViewProtocol.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 08/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

protocol ListViewProtocol : class {
    
    func showLoading()
    func hideLoading()
    func reloadTableView()
    func showAlertError(with title: String, message: String, buttonTitle: String)
}
