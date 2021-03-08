//
//  CollectionViewController.swift
//  Lesson 10
//
//  Created by Феликс Фимберг on 21.10.2020.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    let priceArray = ["3400", "7800", "34000", "12000", "40000", "99990", "2300", "1000", "119000", "178000"]
    let itemsPerRow: CGFloat = 2
    let itemsPerColon: CGFloat = 3
    let insets = UIEdgeInsets(top: 10, left: 20, bottom: 20, right: 20)

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return priceArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.priceLabel.text = priceArray[indexPath.row]
    
        // Configure the cell
    
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let insetsSize = insets.left * (itemsPerRow + 1)
        let avalibleWidth = collectionView.frame.width - insetsSize
        let avalibleHeight = collectionView.frame.height - (insets.left * (itemsPerColon + 1)) - 88
        let cellWidth = avalibleWidth / itemsPerRow - 1
        let cellHeight = avalibleHeight / itemsPerColon
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return insets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return insets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return insets.left
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! Header
        
        return header
    }
}
