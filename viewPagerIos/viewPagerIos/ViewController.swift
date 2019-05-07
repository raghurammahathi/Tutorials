//
//  ViewController.swift
//  viewPagerIos
//
//  Created by SunarcMac on 09/01/19.
//  Copyright © 2019 SunarcMac. All rights reserved.
//

import UIKit

var sortImages = ["form-icon.png","important.png","form-icon.png","form-icon.png","important.png","form-icon.png"]
var namesArray = ["Raghu","Anand suthar","Raj kumar joshi", "laxmi","shruthi bhateja","Ramniwas suthar"]
class ViewController: UIViewController {

  let cellId = "cellId"
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var tabBarCollection: UICollectionView!
    @IBOutlet weak var barLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var barView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setUpCollection()
         setUpTabBarCollection()
    }

    func setUpCollection (){
        collection.backgroundColor = UIColor.blue
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collection.isPagingEnabled = true
    }
    func setUpTabBarCollection(){
        tabBarCollection.backgroundColor = UIColor.init(red: 63/255, green: 79/255, blue: 181/255, alpha: 1)
        let selectedIndex = NSIndexPath(item: 0, section: 0)
        tabBarCollection.selectItem(at: selectedIndex as IndexPath, animated: false, scrollPosition: UICollectionView.ScrollPosition.right)
        
//        tabBarCollection.register(UINib(nibName: "TabsCell", bundle: nil), forCellWithReuseIdentifier: "TabsCell")
//        if let flowLayout = tabBarCollection.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
//        }
    }

}
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x)
        barLeftConstraint.constant = scrollView.contentOffset.x/6
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x/view.frame.width
        let indexPath = NSIndexPath(item: Int(index), section: 0)
        tabBarCollection.selectItem(at: indexPath as IndexPath, animated: false, scrollPosition: UICollectionView.ScrollPosition.right)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collection {
            return 6
        }
        return namesArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView == self.collection{
            if indexPath == [0, 0]{
                let oneVC = storyboard?.instantiateViewController(withIdentifier: "OneViewController") as! OneViewController
                oneVC.view.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: view.frame.height-50)
                self.addChild(oneVC)
                let oneVcView = oneVC.view
                cell.contentView.addSubview(oneVcView!)
                oneVC.didMove(toParent: self)
            }
            
            if collectionView == self.collection{
                if indexPath == [0, 1]{
                    let twoVC = storyboard?.instantiateViewController(withIdentifier: "TwoViewController") as! TwoViewController
                    twoVC.view.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: view.frame.height-50)
                    self.addChild(twoVC)
                    let twoVCView = twoVC.view
                    cell.contentView.addSubview(twoVCView!)
                    twoVC.didMove(toParent: self)
                }
            }
            
            if collectionView == self.collection{
                if indexPath == [0, 2]{
                    let threeVC = storyboard?.instantiateViewController(withIdentifier: "ThreeViewController") as! ThreeViewController
                    threeVC.view.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: view.frame.height-50)
                    self.addChild(threeVC)
                    let threeVCView = threeVC.view
                    cell.contentView.addSubview(threeVCView!)
                    threeVC.didMove(toParent: self)
                }
            }
            
            if collectionView == self.collection{
                if indexPath == [0, 3]{
                    let fourVC = storyboard?.instantiateViewController(withIdentifier: "FourViewController") as! FourViewController
                    fourVC.view.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: view.frame.height-50)
                    self.addChild(fourVC)
                    let fourVcView = fourVC.view
                    cell.contentView.addSubview(fourVcView!)
                    fourVC.didMove(toParent: self)
                }
            }
            
            if collectionView == self.collection{
                if indexPath == [0, 4]{
                    let fiveVC = storyboard?.instantiateViewController(withIdentifier: "FiveViewController") as! FiveViewController
                    fiveVC.view.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: view.frame.height-50)
                    self.addChild(fiveVC)
                    let fiveVcView = fiveVC.view
                    cell.contentView.addSubview(fiveVcView!)
                    fiveVC.didMove(toParent: self)
                }
            }
            
            if collectionView == self.collection{
                if indexPath == [0, 5]{
                    let sixVC = storyboard?.instantiateViewController(withIdentifier: "SixViewController") as! SixViewController
                    sixVC.view.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: view.frame.height-50)
                    self.addChild(sixVC)
                    let sixVcView = sixVC.view
                    cell.contentView.addSubview(sixVcView!)
                    sixVC.didMove(toParent: self)
                }
            }
        }
    }

    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//
//
//        if collectionView == collection{
//            let oneVC = storyboard?.instantiateViewController(withIdentifier: "OneViewController") as! OneViewController
//            oneVC.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//            let oneVcView = oneVC.view
//
//            let twoVC = storyboard?.instantiateViewController(withIdentifier: "TwoViewController") as! TwoViewController
//            twoVC.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//            let twoVCView = twoVC.view
//
//            let threeVC = storyboard?.instantiateViewController(withIdentifier: "ThreeViewController") as! ThreeViewController
//            threeVC.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//            let threeVCView = threeVC.view
//
//            let fourVC = storyboard?.instantiateViewController(withIdentifier: "FourViewController") as! FourViewController
//            fourVC.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//            let fourVcView = fourVC.view
//
//            let fiveVC = storyboard?.instantiateViewController(withIdentifier: "FiveViewController") as! FiveViewController
//            fiveVC.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//            let fiveVcView = fiveVC.view
//
//            let sixVC = storyboard?.instantiateViewController(withIdentifier: "SixViewController") as! SixViewController
//            sixVC.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//            let sixVcView = sixVC.view
//
//            let viewsArray = [oneVcView, twoVCView, threeVCView, fourVcView, fiveVcView, sixVcView]
//
//            cell.contentView.addSubview(viewsArray[indexPath.row]!)
//
//
//        }
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collection {
            let cell = collection.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)

            return cell
        }
        else {
            if let iconsCell: IconsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "IconsCell", for: indexPath) as? IconsCell
            {
                iconsCell.imgSortItems.image = UIImage(named: sortImages[indexPath.row])?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
                iconsCell.tintColor = UIColor.init(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)
             
            // iconsCell.namesLbl.text = namesArray[indexPath.row]
                return iconsCell
            }
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collection {
            return CGSize(width: view.frame.width, height: view.frame.height)
        }else if collectionView == tabBarCollection{
            return CGSize(width: view.frame.width/6, height: view.frame.height)
        }
    return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == tabBarCollection{
            print(indexPath.item)
            let x = CGFloat(indexPath.item) * view.frame.width/6
            barLeftConstraint.constant = x
            scrolltoMenuIndex(menuIndex: indexPath.item)
        }
    }
    
    func scrolltoMenuIndex(menuIndex: Int){

        let index = NSIndexPath(item: menuIndex, section: 0)
        collection.scrollToItem(at: index as IndexPath, at: UICollectionView.ScrollPosition.left, animated: false)
    }
}

class IconsCell: UICollectionViewCell {
    @IBOutlet weak var imgSortItems: UIImageView!
    override var isSelected: Bool {
        didSet{
            if isSelected == true {
                imgSortItems.tintColor = UIColor.white
            } else {
                imgSortItems.tintColor = UIColor.init(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)
            }

        }
    }
}
