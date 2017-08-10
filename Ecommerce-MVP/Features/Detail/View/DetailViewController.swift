//
//  DetailViewController.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 10/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var pokemonDescription: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var types: UILabel!
    @IBOutlet weak var weakness: UILabel!
    @IBOutlet weak var typesBotMargin: NSLayoutConstraint!
    @IBOutlet weak var weaknessBotMargin: NSLayoutConstraint!
    
    var pokemon: Pokemon?
    var priceString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setContent()
    }
    
    private func setContent() {
        
        guard let pokemon = self.pokemon else {
            return print("pokemon detail nil")
        }
        
        self.title = pokemon.name
        self.pokemonDescription.text = pokemon.description
        self.price.text = priceString
        
        self.pokemonImage.sd_setShowActivityIndicatorView(true)
        self.pokemonImage.sd_setIndicatorStyle(.white)
        self.pokemonImage.sd_setImage(with: URL(string: pokemon.image), placeholderImage: #imageLiteral(resourceName: "placeholder"))
    }
}

extension DetailViewController: DetailViewProtocol {
    
    func updateBackground(image: UIImage) {
        
        self.background.image = image
        /*
        if types.contains(where: { $0.option == Kind.Option.fire }) {
            self.background.image = #imageLiteral(resourceName: "fire-background")
        }
        else if types.contains(where: { $0.option == Kind.Option.flying }) {
            self.background.image = #imageLiteral(resourceName: "sky-background")
        }
        else if types.contains(where: { $0.option == Kind.Option.water }) {
            self.background.image = #imageLiteral(resourceName: "water-background")
        }
        else { self.background.image = #imageLiteral(resourceName: "default-background") }
        */
    }
    
    func showTypes(images: [UIImage]) {
        
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
    
    func showWeakness(images: [UIImage]) {
        
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
