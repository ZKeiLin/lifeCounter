//
//  HistoryViewController.swift
//  lifecounter
//
//  Created by Zhiqi Lin on 1/30/19.
//  Copyright © 2019 Zhiqi Lin. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    //,UICollectionViewDataSource, UICollectionViewDelegate
    @IBOutlet weak var historyCollection: UICollectionView!
    @IBOutlet weak var test: UILabel!
    
    var historyList:[Int] = []
    var users:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyCollection.delegate = self
        historyCollection.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "historyCell", for: indexPath) as! HistoryCollectionViewCell
        print(users[indexPath.row])
        cell.userID.text = String(users[indexPath.row])
        cell.lifeCount.text = String(historyList[indexPath.row])
        return cell
    }
    
    @IBAction func backButton(_ sender: Any) {
//        performSegue(withIdentifier: "back", sender: self)
        self.dismiss(animated: true, completion: nil)
    }
    
 
}
