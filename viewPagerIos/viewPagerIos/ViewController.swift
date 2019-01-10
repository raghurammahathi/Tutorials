//
//  ViewController.swift
//  viewPagerIos
//
//  Created by SunarcMac on 09/01/19.
//  Copyright © 2019 SunarcMac. All rights reserved.
//

import UIKit

var sortImages = ["form-icon.png","important.png","form-icon.png"]
class ViewController: UIViewController {

  let cellId = "cellId"
    
    @IBOutlet weak var collection: UICollectionView!
    
    @IBOutlet weak var tabBarCollection: UICollectionView!
    
    @IBOutlet weak var barLeftConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var barView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.backgroundColor = UIColor.blue
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collection.isPagingEnabled = true
        // Do any additional setup after loading the view, typically from a nib.
      
        tabBarCollection.backgroundColor = UIColor.init(red: 63/255, green: 79/255, blue: 181/255, alpha: 1)
        
    }

    

}
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x)
        barLeftConstraint.constant = scrollView.contentOffset.x/3
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collection {
            return 3
        }
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let colors: [UIColor] = [.gray, .orange, .purple]

        if collectionView == self.collection {
            let cell = collection.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
            cell.backgroundColor = colors[indexPath.item]
            return cell
        }
            
        else {
            
            if let IconsCell: IconsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "IconsCell", for: indexPath) as? IconsCell
            {

                IconsCell.imgSortItems.image = UIImage(named: sortImages[indexPath.row])

                return IconsCell
            }
            return UICollectionViewCell()
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       
        if collectionView == self.collection {
            return CGSize(width: view.frame.width, height: view.frame.height)
        }else if collectionView == tabBarCollection{
            return CGSize(width: view.frame.width/3, height: view.frame.height)
        }
    return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == tabBarCollection{
            
            print(indexPath.item)
            let x = CGFloat(indexPath.item) * view.frame.width/3
            barLeftConstraint.constant = x
            
//            UIView.animate(withDuration: 0.75) {
//                self.view.layoutIfNeeded()
//            }
            
//            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//                self.view.layoutIfNeeded()
//            }, completion: nil)
            
           scrolltoMenuIndex(menuIndex: indexPath.item)
            
        }
        
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
////        if collectionView == tabBarCollection{
////        return 0
////        } else{
////            return
////        }
//        return 0
//    }
    
    func scrolltoMenuIndex(menuIndex: Int){
    
        let index = NSIndexPath(item: menuIndex, section: 0)
        collection.scrollToItem(at: index as IndexPath, at: UICollectionView.ScrollPosition.left, animated: false)
    
    }
    
}

class IconsCell: UICollectionViewCell {
    
    @IBOutlet weak var imgSortItems: UIImageView!
    
    
    
    
}
