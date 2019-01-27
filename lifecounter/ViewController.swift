//
//  ViewController.swift
//  lifecounter
//
//  Created by Zhiqi Lin on 1/26/19.
//  Copyright © 2019 Zhiqi Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let users = ["1", "2"]
    let score = ["20", "10"]
    let image = [UIImage(named: "personicon"), UIImage(named: "personicon")]
    
    let buttons = ["+","+5","-","-5"]
    
    @IBOutlet weak var roundedRecButton: UIButton!
    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        roundedRecButton.layer.cornerRadius = 10
        collection.layer.masksToBounds = false
        // Do any additional setup after loading the view, typically from a nib.

    }
    
//    func buttonCollectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return buttons.count
//    }
//    
//    func buttonCollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "buttonCell", for: indexPath) as! ButtonsCollectionCell
////        cell.command.setTitle(buttons[indexPath.row], for: .normal)
////        cell.command.title = buttons[indexPath.row]
//        return cell
//    }
//    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.userID.text = users[indexPath.row]
        cell.userProfile.image = image[indexPath.row]
        cell.score.text = score[indexPath.row]
        cell.contentView.layer.masksToBounds = false
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black.cgColor

//        cell.layer.borderWidth = 1.0
//        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 2, height: 4)
        cell.layer.shadowOpacity = 0.1
        cell.layer.shadowRadius = 15
        return cell
    }
    
}

