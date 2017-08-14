//
//  StoreViewController.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 14/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {

    @IBOutlet weak var btnAccept: UIButton!
    @IBOutlet weak var btnJump: UIButton!
    @IBOutlet weak var btnDecline: UIButton!
    @IBOutlet weak var imgJoy: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.transition(with: self.view,
                          duration: 1,
                          options: .showHideTransitionViews,
                          animations: {
                            self.btnAccept.isHidden = true
                            self.btnDecline.isHidden = true },
                          completion: nil)
    }
}

// MARK: Actions

extension StoreViewController {

    @IBAction func acceptTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func jumpTapped(_ sender: UIButton) {
        
        UIView.transition(with: imgJoy,
                          duration: 1,
                          options: .showHideTransitionViews,
                          animations: {
                                self.imgJoy.image = #imageLiteral(resourceName: "nurse_joy2")
                                self.btnJump.removeFromSuperview()
                                self.btnAccept.isHidden = false
                                self.btnDecline.isHidden = false },
                          completion: nil)
    }
    
    @IBAction func declineTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
