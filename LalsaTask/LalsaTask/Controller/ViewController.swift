//
//  ViewController.swift
//  LalsaTask
//
//  Created by Raghu ram mahathi on 31/03/19.
//  Copyright © 2019 Name. All rights reserved.
//

import UIKit

var layout = CustomLayout()
var imageView = UIImageView()
var cardView = UIView()

class ViewController: UIViewController {

    @IBOutlet weak var CollProducts: UICollectionView!
        override func viewDidLoad() {
        super.viewDidLoad()
            
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCell", for: indexPath) as! ProductsCell
        cell.productImg.image = UIImage.init(named: "food")
        cell.addBtn.layer.cornerRadius = 5
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemsPerRow:CGFloat = 2
        var itemWidth = (collectionView.bounds.width / itemsPerRow) - 3 * itemsPerRow
        let itemHeight:CGFloat = 315.0
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            itemWidth = (collectionView.bounds.width / 3) - 4 * itemsPerRow
        }
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {

        case UICollectionView.elementKindSectionHeader:

            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: "SectionHeader",
                                                                             for: indexPath) as! SectionHeaderCollectionReusableView
            
            setupViews()

            return headerView
        default:

            assert(false, "Unexpected element kind")
        }
        return UICollectionReusableView()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {


        print(scrollView.contentOffset.y)
        if scrollView.contentOffset.y > -44.0 {

            let rect = CGRect(x: 0, y: 0, width: view.bounds.width, height: 100)
            imageView.frame = rect
            
            let cardRect = CGRect(x: 65, y: 50, width: 285.5, height: 215)
            cardView.frame = cardRect
            


        } else{
            
            let rect = CGRect(x: 0, y: 0, width: view.bounds.width, height: 200)
            imageView.frame = rect
            
            let cardRect = CGRect(x: 65, y: 220, width: 285.5, height: 215)
            cardView.frame = cardRect
            

        }

    }
    
    func setupViews() {
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 200))
        imageView.image = UIImage(named: "header.jpg")
        imageView.contentMode = .scaleAspectFill
        self.view.addSubview(imageView)
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
//        cardView = UIView(frame: CGRect(x: 65, y: 220, width: 285.5, height: 215))
//        cardView.backgroundColor = .red
//        self.view.addSubview(cardView)
    }
    
}

class ProductsCell: UICollectionViewCell {

    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var addBtn: UIButton!
    
}

class SectionHeaderCollectionReusableView: UICollectionReusableView {
    
    
    @IBOutlet weak var headerHeight: NSLayoutConstraint!
    @IBOutlet weak var hideView: UIView!

}
