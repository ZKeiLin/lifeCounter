//
//  operation button.swift
//  lifecounter
//
//  Created by Zhiqi Lin on 1/29/19.
//  Copyright © 2019 Zhiqi Lin. All rights reserved.
//

import UIKit

class operation_button: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 4)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 10
    }
}


