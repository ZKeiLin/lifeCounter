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
    
    @IBOutlet weak var score: UILabel!
    
    override var isSelected: Bool{
        didSet {
            if self.isSelected {
                userID.textColor = UIColor.orange
                
            }
        }
        //Write your code for cell selection here
    }
    
}
