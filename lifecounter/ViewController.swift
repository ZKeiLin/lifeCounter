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
    let image = [UIImage(named:"personicon"), UIImage(named: "personicon")   ]
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var roundedRecButton: UIButton!
    
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var minus5: UIButton!
    @IBOutlet weak var plus5: UIButton!
    @IBOutlet weak var buttonSlackView: UIStackView!
    @IBOutlet weak var userCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = view.frame.size.width-40
        let layout = userCollection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: 80)
        userCollection.frame.origin.x = view.frame.width / 2 - userCollection.frame.width/2
        userCollection.frame.origin.y = roundedRecButton.frame.origin.y + roundedRecButton.frame.size.height + 10
        roundedRecButton.layer.cornerRadius = 25
        userCollection.layer.masksToBounds = false
        plusButton.layer.cornerRadius = 30
        plus5.layer.cornerRadius = 30
        minus.layer.cornerRadius = 30
        minus5.layer.cornerRadius = 30
        buttonSlackView.frame.origin.x = view.frame.width / 2 - buttonSlackView.frame.width/2
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.userID.text = users[indexPath.row]
        cell.userProfile.image = image[indexPath.row]
        cell.score.text = score[indexPath.row]
        
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black.cgColor

        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 2, height: 4)
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowRadius = 10
        return cell
    }
    
}

