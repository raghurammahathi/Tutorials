//
//  CollectionVC.swift
//  PaytmIOS
//
//  Created by Anand Suthar on 16/01/19.
//  Copyright © 2019 Anand Suthar. All rights reserved.
//

import UIKit

class CollectionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}

extension CollectionVC:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =   collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)as! CollectionCelll
        cell.imgCol.image = #imageLiteral(resourceName: "pay-using-paytm-win-rs-1000-cashback")
        cell.lblCol.text = "Paytm"
        return cell
    }
    
    
    
    
    
    
    
    
    
    
}

class CollectionCelll:UICollectionViewCell {
    
    
    @IBOutlet weak var imgCol: UIImageView!
    
    @IBOutlet weak var lblCol: UILabel!
    
    
    
}
