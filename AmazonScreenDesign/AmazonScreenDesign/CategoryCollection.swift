//
//  CategoryCollection.swift
//  AmazonScreenDesign
//
//  Created by Raghu ram mahathi on 22/01/19.
//  Copyright © 2019 Raghu ram mahathi. All rights reserved.
//

import UIKit

var productsNames = ["Amazon Pay","Scan","Recharges","Pay Bills","Offers"]
var productImages = ["purse.png","qrcode.png","purse.png","qrcode.png","purse.png"]

class CategoryCollection: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let productsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCell", for: indexPath) as! ProductsCell
        productsCell.productLbl.text = productsNames[indexPath.row]
        productsCell.productImage.image = UIImage(named: productImages[indexPath.row])
        return productsCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (UIScreen.main.bounds.width / 5) - 2 * 5
        return CGSize(width: itemWidth, height: collectionView.frame.height)
    }

}
