//
//  PokemonCollectionViewCell.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 06/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension PokemonCollectionViewCell {

    func fillOutlets() {
        self.name.text = "Pikachu"
    }
}
