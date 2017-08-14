//
//  ListPresenter.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 08/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

final class ListPresenter {

    fileprivate unowned let view: ListViewProtocol
    fileprivate let router: ListRouterProtocol
    fileprivate let service: CategoryService
    
    // Storage properties
    fileprivate var items: [Category] = []
    fileprivate(set) var viewItems: [CategoryProtocol] = []
    
    init(view: ListViewProtocol) {
        self.view = view
        self.router = ListRouter(view: view)
        self.service = CategoryService()
    }
}

// MARK: - Public methods

extension ListPresenter {
    
    func showList() {
        self.view.showLoading()
        self.service.getCategories(success: {
                [weak self] result in
                Do.now { self?.storeResults(with: result) }
            }, fail: {
                [weak self] failure in
                Do.now { self?.requestError(message: failure) }
        })
    }
    
    func itemSelected(section: Int, row: Int) {
        
        let item = self.items[section].pokemons[row]
        router.showDetail(with: item, price: self.items[section].price)
    }
}

// MARK: - Private methods

extension ListPresenter {

    fileprivate func storeResults(with: [Category]) {
        self.items = with
        self.viewItems = parseItems(for: with)
        Do.wait(seconds: 1) { self.showView(for: self.viewItems) }
    }
    
    fileprivate func requestError(message: String) {
        view.showAlertError(with: "Error", message: message, buttonTitle: "OK")
    }
    
    fileprivate func showView(for category: [CategoryProtocol]) {
        view.hideLoading()
        view.reloadTableView()
    }
}

// MARK: - Parse

extension ListPresenter {

    fileprivate func parseItems(for categories: [Category]) -> [CategoryProtocol] {
        
        var categoriesProtocol: [CategoryProtocol] = []
        
        for category in categories {
            categoriesProtocol.append(CategoryModel(model: category))
        }
        
        return categoriesProtocol
    }
}
