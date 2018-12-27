//
//  CollectionViewController.swift
//  CustomCollLayout
//
//  Created by SunarcMac on 27/12/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import UIKit
import AVFoundation

class CollectionViewController: UICollectionViewController {
    
    var names = ["aaaaaaaaa","bbbbbbbbb","cccccccccc","dddddddddd","eeeeeeeeee","ffffffffff"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = collectionView?.collectionViewLayout as? MyLayout {
            layout.delegate = self
        }
    
    }
    
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath as IndexPath) as! CollectionViewCell
        cell.lbl.text = names[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       // let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
       // let itemSize = collectionView.frame.height
        return CGSize(width: 50, height: 40)
    }
    
}
extension CollectionViewController: MyLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        
        return CGFloat(names[indexPath.row].count + 100)
        
        
    }
}
