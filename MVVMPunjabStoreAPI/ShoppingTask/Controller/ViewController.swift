//
//  ViewController.swift
//  ShoppingTask
//
//  Created by SunarcMac on 17/10/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var collView: UICollectionView!
   
    var itemsViewModels = [ItemViewModel]()
    var page = 0
    var waiting: Bool? = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getProductsData()
    }
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return itemsViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let itemsCell = collView.dequeueReusableCell(withReuseIdentifier: "ItemsCell", for: indexPath) as! ItemsCell
        itemsCell.itemViewModel = itemsViewModels[indexPath.row]
        return itemsCell
        
    }
    
   func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    if indexPath.row == self.itemsViewModels.count-1 && !self.waiting!  {
        
        self.waiting = true
        page = page + 1
        self.getProductsData()
        
        }
        
    }

    func getProductsData() {
       
        Products.getProducts(pageNumber: page, { (itemsArray) in
            self.itemsViewModels.append(contentsOf: itemsArray.map({return ItemViewModel(items: $0)}))
            self.waiting = false
            self.collView.reloadData()
        }) { (error) in
            print(error)
        }
       
    }
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            return CGSize(width: collView.bounds.width/3 - 2, height: collView.bounds.width/3 - 2)

        } else {
            return CGSize(width: collView.bounds.width/2 - 2, height: collView.bounds.width/2 - 2)

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
}

class ItemsCell: UICollectionViewCell {
    
    @IBOutlet weak var imgItem: UIImageView!
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var lblItemPrice: UILabel!
    @IBOutlet weak var imgLike: UIImageView!
    
    
    var itemViewModel: ItemViewModel! {
        didSet {
            lblItemName.text = itemViewModel.name
            
            self.lblItemPrice.text = "$\(String(describing: itemViewModel.price)).00"

            let index = 3
            if index >= 0 && index < itemViewModel.customAttributes.count {
                if let thumbnail = itemViewModel.customAttributes[index].value {
                    imgItem.kf.setImage(with: URL(string: thumbnail), placeholder: nil, options: [.transition(ImageTransition.fade(1)), .scaleFactor(1.0)], progressBlock: { (receivedSize, totalSize) in
                    }, completionHandler: { (image: Image?, error: NSError?, cacheType, urlImage: URL?) in
                    })
                }
            } else{ return }
        }
    }

//    var itemData: ItemData?{
//
//        didSet {
//            if let itemData = itemData {
//
//                self.lblItemName.text = itemData.name
//             //   self.lblItemPrice.text = "$\(itemData.price!).00"
//                let index = 3
//                if index >= 0 && index < itemData.customAttributes.count {
//                    if let thumbnail = itemData.customAttributes[index].value {
//                         imgItem.kf.setImage(with: URL(string: thumbnail), placeholder: nil, options: [.transition(ImageTransition.fade(1)), .scaleFactor(1.0)], progressBlock: { (receivedSize, totalSize) in
//                        }, completionHandler: { (image: Image?, error: NSError?, cacheType, urlImage: URL?) in
//                        })
//                    }
//                } else{ return }
//            }
//        }
//    }
}


