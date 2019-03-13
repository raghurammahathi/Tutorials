//
//  ViewController.swift
//  PaytmIOS
//
//  Created by Anand Suthar on 15/01/19.
//  Copyright © 2019 Anand Suthar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var detailCollectionView: UICollectionView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var menuBtn: UIButton!
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var cashBackBtn: UIButton!
    
    var overlayView:UIView!
    var offsetDenominator:CGFloat!
    var setcolor = (red: 17.0/255.0, green: 119.0/255.0, blue: 151.0/255.0, alpha: 1.0)
   
    //let TARGER_COLOR = UIColor(red: 3.0/255.0, green: 83.0/255.0, blue: 191.0/255.0, alpha: 1)
       let TARGER_COLOR = UIColor.white
    var headerTitle = ["25 RupeCashback. Use Promocode:GRAb25. Recharge Now!","25 RupeCashback. Use Promocode:GRAb25. Recharge Now!"]
    var headerPhoto = [#imageLiteral(resourceName: "megaphone"),#imageLiteral(resourceName: "megaphone")]
    var arraw = [#imageLiteral(resourceName: "right-arrow"),#imageLiteral(resourceName: "right-arrow")]
    var tiltes = ["Pay","UPI Money Transfer","PassBook","Add Money","Lifafa","BHIM UPI","Accept Payment","Link Your Bank A/c"]
    var imgtitles = [#imageLiteral(resourceName: "rupee-indian") ,#imageLiteral(resourceName: "money"),#imageLiteral(resourceName: "apple"),#imageLiteral(resourceName: "rupees"),#imageLiteral(resourceName: "money"),#imageLiteral(resourceName: "apple"),#imageLiteral(resourceName: "rupees"),#imageLiteral(resourceName: "money")]
    var image = [#imageLiteral(resourceName: "light-bulb.png"),#imageLiteral(resourceName: "underground"),#imageLiteral(resourceName: "smartphone"),#imageLiteral(resourceName: "water"),#imageLiteral(resourceName: "icon"),#imageLiteral(resourceName: "antenna-2"),#imageLiteral(resourceName: "video"),#imageLiteral(resourceName: "credit-card"),#imageLiteral(resourceName: "front-bus.png"),#imageLiteral(resourceName: "icon-2"),#imageLiteral(resourceName: "headphones.png"),#imageLiteral(resourceName: "more")]
    var imageNAme = ["Electricity","Train Ticket","Mobile Postpaid","Water","Mobile Prepaid","DTH","Movie Ticket","Credit Card","Bus","Grocery","UP to 30% CashBack","More"]
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
       collectionView.reloadData()
        detailCollectionView.reloadData()
        img.layer.cornerRadius = 10
       // self.headerView.backgroundColor = UIColor.black

        if let navCtrl = self.navigationController {
            self.offsetDenominator = headerView.frame.size.height - navCtrl.navigationBar.frame.height

            let targetCIColor = CIColor(cgColor: self.TARGER_COLOR.cgColor)
            let overlayColor = UIColor(red: targetCIColor.red, green: targetCIColor.green, blue: targetCIColor.blue, alpha: 0.0)

            self.overlayView = UIView(frame: self.headerView.frame)
            self.overlayView.backgroundColor = overlayColor

            self.view.addSubview(self.overlayView)
        }
        
        
    }
    


}

extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return tiltes.count ?? 1
            
        }
        if collectionView.tag == 1 {
            return image.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCell
        cell.headview.layer.cornerRadius = cell.headview.bounds.width/2
        cell.lblTitle.text = tiltes[indexPath.row] as? String
      cell.imgTitle.image = imgtitles[indexPath.row] as? UIImage
        return cell
        }
        if collectionView.tag == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCellDeatil", for: indexPath) as! CollectionCellDeatil
            //cell.imgCell.layer.cornerRadius = 40/2
            
            cell.imgCell.image = image[indexPath.row] as? UIImage
            cell.lblDetails.text = imageNAme[indexPath.row] as? String
            
            return cell
        }
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCellDeatil", for: indexPath) as! CollectionCellDeatil
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectioncell", for: indexPath)as! HeaderCollectioncell
      //  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCollectioncell", for: indexPath)as! HeaderCollectioncell
        cell.headerImg.image = headerPhoto[indexPath.section]
        cell.headerLbl.text = headerTitle[indexPath.section]
        cell.arrowImg.image = arraw[indexPath.section]
        return cell
    }
    
    
}

extension ViewController:UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1{
            let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom
            
            // 2. check the idiom
            switch (deviceIdiom) {
                
            case .pad:
                
                let widthPerItem =  detailCollectionView.bounds.width
                let hight = detailCollectionView.bounds.height-50
                return CGSize(width: widthPerItem/4-1, height: hight/3-1)
                print("iPad style UI")
            case .phone:
                let widthPerItem =  detailCollectionView.bounds.width
                let hight = detailCollectionView.bounds.height-50
                return CGSize(width: widthPerItem/4-1, height: hight/3-1)
                print("iPhone and iPod touch style UI")
            case .tv:
                print("tvOS style UI")
            default:
                print("Unspecified UI idiom")
            }
      //  let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
    //    let availableWidth = view.frame.width - paddingSpace
     //   let widthPerItem = availableWidth / itemsPerRow
      
        }
        return CGSize(width: collectionView.bounds.width/4, height: collectionView.bounds.width/4)
    }
    
    //3
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//        return 1
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 1 {
              return 1
        }
        return 0
       
    }
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 1 {
            return 1
        }
        return 0
    }
   
    
   
}

extension ViewController: UIScrollViewDelegate{
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        var offset = scrollView.contentOffset.y
        print("1")
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        var offset = scrollView.contentOffset.y
        print("2")
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        var offset = scrollView.contentOffset.y
        print("3")
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        var offset = scrollView.contentOffset.y
        print("4")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        var offset = scrollView.contentOffset.y
        print("5")
        if let navCtrl = self.navigationController, let breakpoint = offsetDenominator {
            let alpha = scrollView.contentOffset.y / breakpoint

            if alpha >= 1.0  {
                navCtrl.navigationBar.backgroundColor = self.TARGER_COLOR
               self.menuBtn.tintColor = UIColor(hue: 1, saturation: offset, brightness: 1, alpha: 1)
                cashBackBtn.tintColor = UIColor.black
            } else {
                let targetCIColor = CIColor(cgColor: self.TARGER_COLOR.cgColor)
                let overlayColor = UIColor(red: targetCIColor.red, green: targetCIColor.green, blue: targetCIColor.blue, alpha: alpha)

                self.overlayView.backgroundColor = overlayColor
                navCtrl.navigationBar.backgroundColor = UIColor.clear
            }
        }
    
}
}

class CollectionCell:UICollectionViewCell {
    
    @IBOutlet weak var imgTitle: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
  
    @IBOutlet weak var headview: UIView!
}


class CollectionCellDeatil: UICollectionViewCell {
    
    @IBOutlet weak var imgCell: UIImageView!
    
    
    @IBOutlet weak var lblDetails: UILabel!
    
    
}

class HeaderCollectioncell:UICollectionReusableView {
    
    @IBOutlet weak var headerLbl: UILabel!
  
    @IBOutlet weak var headerImg: UIImageView!
    @IBOutlet weak var arrowImg: UIImageView!
    
    
}
