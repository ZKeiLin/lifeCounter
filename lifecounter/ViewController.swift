//
//  ViewController.swift
//  lifecounter
//
//  Created by Zhiqi Lin on 1/26/19.
//  Copyright © 2019 Zhiqi Lin. All rights reserved.
//

import UIKit

protocol DataModelDelegate: class {
    func didRecieveDataUpdate(data: String)
}

//protocol DataDelegate {
//    func updatedData(for score: CollectionViewCell, at: IndexPath)
//    func clearAll()
//}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var users = [1,2,3,4]
    var score = [20, 20, 20, 20]
    var selectedItem = -1
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var roundedRecButton: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var minus5: UIButton!
    @IBOutlet weak var plus5: UIButton!
    @IBOutlet weak var buttonSlackView: UIStackView!
    @IBOutlet weak var userCollection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // size of the collection view
        let layout = userCollection.collectionViewLayout as! UICollectionViewFlowLayout
//        if UIDevice.current.orientation.isLandscape{
//            layout.itemSize = CGSize(width: view.frame.width - 40, height: 50)
//        } else{
//        layout.itemSize = CGSize(width: roundedRecButton.frame.width    - 40, height: 60)
//        }
//        userCollection.frame.origin.x = view.frame.width / 2 - userCollection.frame.width/2
//        userCollection.frame.origin.y = roundedRecButton.frame.origin.y + roundedRecButton.frame.size.height
        userCollection.layer.masksToBounds = false
        
        roundedRecButton.layer.cornerRadius = 25

        // button actions
        plusButton.addTarget(self, action: #selector(pressButton(sender:)), for: UIControl.Event.touchUpInside)
        minus5.addTarget(self, action: #selector(pressButton(sender:)), for: UIControl.Event.touchUpInside)
        
        minus.addTarget(self, action: #selector(pressButton(sender:)), for: UIControl.Event.touchUpInside)
        
        plus5.addTarget(self, action: #selector(pressButton(sender:)), for: UIControl.Event.touchUpInside)
        
            roundedRecButton.layer.cornerRadius = 25

        
        //button below
        plusButton.layer.cornerRadius = 30
        plusButton.layer.shadowColor = UIColor.black.cgColor
        plusButton.layer.shadowOffset = CGSize(width: 2, height: 4)
        plusButton.layer.shadowOpacity = 0.2
        plusButton.layer.shadowRadius = 10
        plus5.layer.cornerRadius = 30
        plus5.layer.shadowColor = UIColor.black.cgColor
        plus5.layer.shadowOffset = CGSize(width: 2, height: 4)
        plus5.layer.shadowOpacity = 0.2
        plus5.layer.shadowRadius = 10
        minus.layer.cornerRadius = 30
        minus.layer.shadowColor = UIColor.black.cgColor
        minus.layer.shadowOffset = CGSize(width: 2, height: 4)
        minus.layer.shadowOpacity = 0.2
        minus.layer.shadowRadius = 10
        minus5.layer.cornerRadius = 30
        minus5.layer.shadowColor = UIColor.black.cgColor
        minus5.layer.shadowOffset = CGSize(width: 2, height: 4)
        minus5.layer.shadowOpacity = 0.2
        minus5.layer.shadowRadius = 10
        buttonSlackView.frame.origin.x = view.frame.width / 2 - buttonSlackView.frame.width/2
        
        userCollection.delegate = self
        userCollection.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.userID.text = String(users[indexPath.row])
        cell.userProfile.image = UIImage(named:"personIcon")
        print("change? \(score)")
        cell.score.text = String(score[indexPath.row])
        
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black.cgColor

        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 2, height: 4)
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedItem = indexPath.row
    }
    
    @IBAction func addNewUser(_ sender: Any) {
        users = Array(1...users.count+1)
        score = [Int](repeating: 20, count: users.count)
        self.userCollection.reloadData()
    }
    
    
    @IBAction func pressButton(sender: UIButton){
        print(selectedItem)
        if selectedItem >= 0 {
            switch sender {
            case plusButton:
                score[selectedItem] += 1
            case minus:
                score[selectedItem] -= 1
            case plus5:
                score[selectedItem] += 5
            case minus5:
                score[selectedItem] -= 5
            default:
                return
            }
            if score[selectedItem] <= 0{
                let alertController = UIAlertController(title: "Sorry", message:
                    "Player \(selectedItem + 1) LOSES", preferredStyle: UIAlertController.Style.alert)
                alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default,handler: nil))
                self.present(alertController, animated: true, completion: nil)
                score = [Int](repeating: 20, count: score.count)
            }
            selectedItem = -1
            self.userCollection.reloadData()
        } else {
            let alertController = UIAlertController(title: "Alert", message:
                "Please select a user", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "Sure", style: UIAlertAction.Style.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    //
//    override func viewWillLayoutSubviews() {
//        let layout = userCollection.collectionViewLayout as! UICollectionViewFlowLayout
//        if UIDevice.current.orientation.isLandscape{
//            layout.itemSize = CGSize(width: view.frame.width, height: 50)
//        } else{
//            layout.itemSize = CGSize(width: roundedRecButton.frame.width, height: 60)
//        }
//
//        userCollection.frame.origin.x = view.frame.width / 2 - userCollection.frame.width/2
//        userCollection.frame.origin.y = roundedRecButton.frame.origin.y + roundedRecButton.frame.size.height
//        userCollection.layer.masksToBounds = false
////        userCollection.collectionViewLayout.invalidateLayout()
//
//        layout.invalidateLayout()
//    }
    
//    userCollection.frame.origin.x = view.frame.width / 2 - userCollection.frame.width/2
//    userCollection.frame.origin.y = roundedRecButton.frame.origin.y + roundedRecButton.frame.size.height
//    roundedRecButton.layer.cornerRadius = 25
//    userCollection.layer.masksToBounds = false
//
//        {
//            // size of the collection view
//            let layout = userCollection.collectionViewLayout as! UICollectionViewFlowLayout
//            if UIDevice.current.orientation.isLandscape{
//                layout.itemSize = CGSize(width: roundedRecButton.frame.width - 40, height: 50)
//            } else{
//                layout.itemSize = CGSize(width: roundedRecButton.frame.width, height: 60)
//            }
//            userCollection.collectionViewLayout.invalidateLayout()
//        }
//
    
}

