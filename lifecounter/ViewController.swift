//
//  ViewController.swift
//  lifecounter
//
//  Created by Zhiqi Lin on 1/26/19.
//  Copyright © 2019 Zhiqi Lin. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate{
    
    var users = [1,2]
    var score = [20, 20]
    var selectedItem = -1
    var history : [Int] = [0,0,0,0,0,0,0,0]
    var inputVal : Int = -1
    
    @IBOutlet weak var roundedRecButton: UIButton!
    @IBOutlet weak var userCollection: UICollectionView!
    @IBOutlet weak var inputBox: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // addNew button style setting
        roundedRecButton.layer.cornerRadius = 25
        roundedRecButton.setTitleColor(UIColor(red:0.64, green:0.82, blue:0.94, alpha:1.0), for: .disabled)
        
        // Data Delegate Setup
        userCollection.delegate = self
        userCollection.dataSource = self
        inputBox.delegate = self
    }
    
    @IBAction func editChange(_ sender: Any) {
        inputVal = Int((inputBox.text!)) ?? -1
    }
    
    // User Collection View Setup
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
        if users.count < 8 && score.allSatisfy({$0 == 20}) {
                users = Array(1...users.count+1)
                score = [Int](repeating: 20, count: users.count)
        } else {
            roundedRecButton.isEnabled = false
        }
        self.userCollection.reloadData()
    }
    
    
    @IBAction func historyButton(_ sender: UIButton) {
        performSegue(withIdentifier: "history", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let hisVC = segue.destination as! HistoryViewController
        hisVC.historyList = self.history 
        hisVC.users = self.users
    }

    // button control for the operation buttons
    @IBAction func pressButton(_ sender: UIButton){
        if selectedItem >= 0 {
            switch sender.tag {
            case 0: score[selectedItem] -= 1
            case 1:
                if inputVal>=0 { score[selectedItem] -= inputVal }
            case 2:
                if inputVal>=0 { score[selectedItem] += inputVal }
            case 3: score[selectedItem] += 1
            default: return
            }
            
            if score[selectedItem] <= 0 {
                history[selectedItem]  = history[selectedItem] + 1
                
                // send alert
                let alertController = UIAlertController(title: "Sorry", message:
                    "Player \(selectedItem + 1) LOSES", preferredStyle: UIAlertController.Style.alert)
                alertController.addAction(UIAlertAction(title: "Reset", style: UIAlertAction.Style.default,handler: nil))
                self.present(alertController, animated: true, completion: nil)
                
                score = [Int](repeating: 20, count: score.count)
            }
            
            inputVal = -1
            self.inputBox.text = ""
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

