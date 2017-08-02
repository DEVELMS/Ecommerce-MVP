//
//  PokemonCell.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 31/07/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

class PokemonCell: UITableViewCell {
    
    @IBOutlet weak var collection: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension PokemonCell: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return PokemonCollectionViewCell()
    }
}

extension PokemonCell: UICollectionViewDelegate {
    
}
