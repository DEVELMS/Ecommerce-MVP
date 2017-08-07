//
//  PokemonCell.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 06/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

class PokemonCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customLayout()
    }
}

extension PokemonCell {

    func customLayout() {
        
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let cellHeight = 220
        let cellWidth = cellHeight - 20
        
        layout?.scrollDirection = .horizontal
        layout?.itemSize = CGSize(width: cellWidth, height: cellHeight - 1)
    }
}

extension PokemonCell: UICollectionViewDataSource {
    
    // MARK: Collection view data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.identifier, for: indexPath) as! PokemonCollectionViewCell
        cell.fillOutlets()
        return cell
    }
}

extension PokemonCell: UICollectionViewDelegate {
    
    // MARK: Collection view delegate
}
