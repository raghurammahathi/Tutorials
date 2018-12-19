//
//  FilterViewController.swift
//  DesignDirectoryScreen
//
//  Created by SunarcMac on 19/12/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var tableFilter: UITableView!
    @IBOutlet weak var btnShowRest: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableFilter.estimatedRowHeight = 120

        btnShowRest.layer.cornerRadius = 5
        btnShowRest.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
}



extension FilterViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SortyByCell", for: indexPath) as? SortyByCell
        {
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "SORT BY"
        }else{
            return "FILTER BY"
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

}



class SortyByCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var SortCollectionView: UICollectionView!
    
    var imageArray = [String] ()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.SortCollectionView.delegate = self
        self.SortCollectionView.dataSource = self
        imageArray = ["msg.png","emailIcon.png","msg.png","emailIcon.png"]
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: SortCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SortCollectionViewCell", for: indexPath) as? SortCollectionViewCell
        {
            let randomNumber = Int(arc4random_uniform(UInt32(imageArray.count)))
            cell.imgSortItems.image = UIImage(named: imageArray[randomNumber])
            return cell
        }
        return UICollectionViewCell()
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
//        let size = CGSize(width: 100, height: 100)
//        return size
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //let itemsPerRow:CGFloat = 4
       // let hardCodedPadding:CGFloat = 5
       // let itemWidth = (collectionView.bounds.width / itemsPerRow) - 2 * itemsPerRow
       // let itemHeight = (collectionView.bounds.height / 2) - hardCodedPadding
        
        return CGSize(width: collectionView.bounds.width/4, height:collectionView.bounds.width )
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 2
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}



class SortCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgSortItems: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}




