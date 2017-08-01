//
//  Loading.swift
//  Player
//
//  Created by Lucas M. Soares on 05/01/17.
//
//

import UIKit

class Loader {
    
    let imageView = UIImageView()
    var images = [#imageLiteral(resourceName: "ring_1"), #imageLiteral(resourceName: "ring_2"), #imageLiteral(resourceName: "ring_3"), #imageLiteral(resourceName: "ring_4"), #imageLiteral(resourceName: "ring_5"), #imageLiteral(resourceName: "ring_6"), #imageLiteral(resourceName: "ring_7"), #imageLiteral(resourceName: "ring_8"), #imageLiteral(resourceName: "ring_9"), #imageLiteral(resourceName: "ring_10"), #imageLiteral(resourceName: "ring_11"), #imageLiteral(resourceName: "ring_12"), #imageLiteral(resourceName: "ring_13"), #imageLiteral(resourceName: "ring_14"), #imageLiteral(resourceName: "ring_15"), #imageLiteral(resourceName: "ring_16"), #imageLiteral(resourceName: "ring_17"), #imageLiteral(resourceName: "ring_18"), #imageLiteral(resourceName: "ring_19"), #imageLiteral(resourceName: "ring_20")]
    var size = TypeSize.larger
    
    enum TypeSize: CGFloat {

        case small = 20
        case medium = 40
        case larger = 60
    }
    
    init(size: TypeSize) {
        
        self.size = size
        imageView.animationImages = images
    }
    
    func start(on: UIView) {
        
        getLoading(to: on)
        imageView.startAnimating()
    }
    
    func stop() {
        
        imageView.stopAnimating()
        imageView.removeFromSuperview()
    }
    
    private func getLoading(to: UIView) {
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
            
        to.addSubview(imageView)
        
        let size: CGFloat = self.size.rawValue
        
        imageView.widthAnchor.constraint(equalToConstant: size).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: size).isActive = true
        imageView.centerXAnchor.constraint(equalTo: to.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: to.centerYAnchor, constant: 0).isActive = true
    }
}
