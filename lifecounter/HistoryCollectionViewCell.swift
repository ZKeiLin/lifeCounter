//
//  HistoryCollectionViewCell.swift
//  lifecounter
//
//  Created by Zhiqi Lin on 1/30/19.
//  Copyright © 2019 Zhiqi Lin. All rights reserved.
//

import UIKit

class HistoryCollectionViewCell: UICollectionViewCell {
       
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @IBOutlet weak var lifeCount: UILabel!
    @IBOutlet weak var userID: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 4)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 10
    }
}
