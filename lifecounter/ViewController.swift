//
//  ViewController.swift
//  lifecounter
//
//  Created by Zhiqi Lin on 1/26/19.
//  Copyright © 2019 Zhiqi Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var users = [1,2,3,4]
    var score = [20, 20, 20, 20]
    var selectedItem = -1
    
    @IBOutlet weak var roundedRecButton: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var minus5: UIButton!
    @IBOutlet weak var plus5: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var buttonSlackView: UIStackView!
    @IBOutlet weak var userCollection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // button actions
        plusButton.addTarget(self, action: #selector(pressButton(sender:)), for: UIControl.Event.touchUpInside)
        minus5.addTarget(self, action: #selector(pressButton(sender:)), for: UIControl.Event.touchUpInside)
        minus.addTarget(self, action: #selector(pressButton(sender:)), for: UIControl.Event.touchUpInside)
        plus5.addTarget(self, action: #selector(pressButton(sender:)), for: UIControl.Event.touchUpInside)
        
        // add new button style
        roundedRecButton.layer.cornerRadius = 25
        roundedRecButton.layer.cornerRadius = 25
        
        // collectionView data Delegate
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
        cell.score.text = String(score[indexPath.row])
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
        if selectedItem >= 0 {
            switch sender {
            case plusButton: score[selectedItem] += 1
            case minus: score[selectedItem] -= 1
            case plus5: score[selectedItem] += 5
            case minus5: score[selectedItem] -= 5
            default: return
            }
            if score[selectedItem] <= 0 {
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
}

