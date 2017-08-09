//
//  PokemonCollectionViewCell.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 06/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit
import SDWebImage

class PokemonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var item: PokemonProtocol? {
        didSet {
            self.fillOutlets()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension PokemonCollectionViewCell {

    func fillOutlets() {
        
        guard let item = item else { return }
        
        self.name.text = item.name
        self.image.sd_setShowActivityIndicatorView(true)
        self.image.sd_setIndicatorStyle(.white)
        self.image.sd_setImage(with: URL(string: item.image), placeholderImage: #imageLiteral(resourceName: "placeholder"))
    }
}
