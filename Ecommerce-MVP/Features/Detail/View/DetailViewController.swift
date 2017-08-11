//
//  DetailViewController.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 10/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet fileprivate weak var background: UIImageView!
    @IBOutlet fileprivate weak var pokemonDescription: UILabel!
    @IBOutlet fileprivate weak var price: UILabel!
    @IBOutlet fileprivate weak var pokemonImage: UIImageView!
    @IBOutlet fileprivate weak var types: UILabel!
    @IBOutlet fileprivate weak var weakness: UILabel!
    @IBOutlet fileprivate weak var typesBotMargin: NSLayoutConstraint!
    @IBOutlet fileprivate weak var weaknessBotMargin: NSLayoutConstraint!
    
    var presenter: DetailPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fillViewOutlets()
        self.hidesBottomBarWhenPushed = true
    }
}

// MARK: Private methods

extension DetailViewController {
    
    fileprivate func updateBackground(image: UIImage) {
        self.background.image = image
    }
    
    fileprivate func showTypes(images: [UIImage]) {
        
        var y: CGFloat = 25
        let margins = self.view.layoutMarginsGuide
        
        for image in images {
            
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            self.view.addSubview(imageView)
            
            imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
            imageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: -10).isActive = true
            imageView.bottomAnchor.constraint(equalTo: types.bottomAnchor, constant: y).isActive = true
            
            y += 25
        }
    }
    
    fileprivate func showWeakness(images: [UIImage]) {
        
        var y: CGFloat = 25
        let margins = self.view.layoutMarginsGuide
        
        for image in images {
            
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            self.view.addSubview(imageView)
            
            imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
            imageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 10).isActive = true
            imageView.bottomAnchor.constraint(equalTo: weakness.bottomAnchor, constant: y).isActive = true
            
            y += 25
        }
    }
}

extension DetailViewController: DetailViewProtocol {
    
    func fillViewOutlets(item: DetailModel) {
        
        self.title = item.name
        self.pokemonDescription.text = item.description
        self.price.text = item.price
        
        self.pokemonImage.sd_setShowActivityIndicatorView(true)
        self.pokemonImage.sd_setIndicatorStyle(.white)
        self.pokemonImage.sd_setImage(with: URL(string: item.image), placeholderImage: #imageLiteral(resourceName: "placeholder"))
        
        self.updateBackground(image: item.background)
        self.showTypes(images: item.types)
        self.showWeakness(images: item.weakness)
    }
}
