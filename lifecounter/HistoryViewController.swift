//
//  HistoryViewController.swift
//  lifecounter
//
//  Created by Zhiqi Lin on 1/30/19.
//  Copyright © 2019 Zhiqi Lin. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var historyCollection: UICollectionView!
    
    var historyList:[Int] = []
    var users:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyCollection.delegate = self
        historyCollection.dataSource = self
        
        let sortedHistory = historyList.enumerated().sorted(by: {$0.element > $1.element})
        historyList = sortedHistory.map{$0.element}
        users = sortedHistory.map{$0.offset}
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return historyList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "historyCell", for: indexPath) as! HistoryCollectionViewCell
        cell.userID.text = String(users[indexPath.row]+1)
        cell.lifeCount.text = String(historyList[indexPath.row])
        return cell
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
