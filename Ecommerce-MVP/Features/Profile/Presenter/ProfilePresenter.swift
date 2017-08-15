//
//  ProfilePresenter.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 15/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

final class ProfilePresenter {
    
    fileprivate unowned let view: ProfileViewProtocol
    fileprivate let userDataManager = UserDataManager()
    fileprivate let purchaseDataManager = PurchaseDataManager()
    
    // Storage properties
    fileprivate(set) var viewItems: [PurchaseProfileModel] = []
    fileprivate(set) var viewUser: UserProfileModel?
    
    var sectionCount: Int {
        get {
            if viewUser != nil {
                return 2
            }
            else {
                return 1
            }
        }
    }
    
    init(view: ProfileViewProtocol) {
        self.view = view
    }
}

// MARK: - Public methods

extension ProfilePresenter {
    
    func viewWillAppear() {
        self.updateStorageItems()
    }
}

// MARK: - Private methods

extension ProfilePresenter {

    fileprivate func updateStorageItems() {
        
        guard let user = userDataManager.getUser() else {
            self.view.reloadTableView()
            return
        }
        
        self.viewUser = UserProfileModel(name: user.name)
        self.viewItems = purchaseDataManager.getPurchases()
        self.view.reloadTableView()
    }
}
