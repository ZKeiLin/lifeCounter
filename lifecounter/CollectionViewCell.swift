//
//  UserCard.swift
//  lifecounter
//
//  Created by Zhiqi Lin on 1/27/19.
//  Copyright © 2019 Zhiqi Lin. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
//    @IBOutlet weak var theView: UIStackView!
    
    @IBOutlet weak var userProfile: UIImageView!
    
    @IBOutlet weak var userID: UILabel!
    
    @IBOutlet weak var user: UILabel!
    @IBOutlet weak var score: UILabel!
    
    
    override var isSelected: Bool{
        willSet{
            super.isSelected = newValue
            if newValue
            {
                self.layer.borderWidth = 1.0
                self.layer.borderColor = UIColor.orange.cgColor
                self.userID.textColor = UIColor.orange
                self.user.textColor = UIColor.orange
            }
            else
            {
                self.layer.borderWidth = 0.0
                self.layer.cornerRadius = 0.0
                self.userID.textColor = UIColor(red:0.29, green:0.56, blue:0.74, alpha:1.0)
                self.user.textColor = UIColor(red:0.29, green:0.56, blue:0.74, alpha:1.0)
                self.layer.cornerRadius = 20
            }
        }
        
    }
    
}
