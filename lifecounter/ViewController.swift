//
//  ViewController.swift
//  lifecounter
//
//  Created by Zhiqi Lin on 1/26/19.
//  Copyright © 2019 Zhiqi Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let users = ["1", "2", "3", "4"]
    let score = ["20","20","20","20"]
    
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var roundedRecButton: UIButton!
    
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var minus5: UIButton!
    @IBOutlet weak var plus5: UIButton!
    @IBOutlet weak var buttonSlackView: UIStackView!
    @IBOutlet weak var userCollection: UICollectionView!
//    @IBOutlet weak var userPicker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // size of the collection view
        let layout = userCollection.collectionViewLayout as! UICollectionViewFlowLayout
        if UIDevice.current.orientation.isLandscape{
            layout.itemSize = CGSize(width: view.frame.width - 40, height: 50)

        } else{
            layout.itemSize = CGSize(width: view.frame.width - 40, height: 80)
        }
        
        userCollection.frame.origin.x = view.frame.width / 2 - userCollection.frame.width/2
        userCollection.frame.origin.y = roundedRecButton.frame.origin.y + roundedRecButton.frame.size.height
        roundedRecButton.layer.cornerRadius = 25
        userCollection.layer.masksToBounds = false
        
        //button below
        plusButton.layer.cornerRadius = 30
        plus5.layer.cornerRadius = 30
        minus.layer.cornerRadius = 30
        minus5.layer.cornerRadius = 30
        buttonSlackView.frame.origin.x = view.frame.width / 2 - buttonSlackView.frame.width/2
        
        
//        layout.shouldInvalidateLayoutForBoundsChange(true)
    //        userPicker.delegate = self
    //            userPicker.dataSource = self
//        userPicker.delegate = self
//        userPicker.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.userID.text = users[indexPath.row]
        cell.userProfile.image = UIImage(named:"personIcon")
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
    
    
    
//
//    @IBAcion func pressButton(_ sender: UIButton) {
//
//
//    }
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    // The number of rows of data
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return users.count
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return users[row]
//    }
    
}

