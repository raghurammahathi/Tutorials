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
       // tableFilter.estimatedRowHeight = 200

        btnShowRest.layer.cornerRadius = 5
        btnShowRest.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
}



extension FilterViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0:
            return 200
        case 1:
            if indexPath.row == 0{
                return 100
            }
            if indexPath.row == 1{
                return 200
            }
            if indexPath.row == 2{
                return 200
            }
        default:
            return 200
        }
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 3
       
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SortyByCell", for: indexPath) as! SortyByCell
            return cell
        case 1:
            if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FilterByCell") as! FilterByCell
            return cell
            }
            if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopCuisinesCell") as! TopCuisinesCell
            return cell
            }
            if indexPath.row == 2 {
             let cell = tableView.dequeueReusableCell(withIdentifier: "AllCuisinesCell") as! AllCuisinesCell
                return cell
            }
        default:
        return UITableViewCell()
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
    var itemNames = [String] ()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.SortCollectionView.delegate = self
        self.SortCollectionView.dataSource = self
        imageArray = ["relevance.png","rating.png","deliveryTime.png","freeDelivery.png","minimumOrder.png"]
        itemNames = ["Relevance","Rating","Delivery Time","Delivery Free","Minimum Order"]
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
            
            cell.imgSortItems.image = UIImage(named: imageArray[indexPath.row])
            cell.lblSortItems.text = itemNames[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (collectionView.bounds.width / 5) - 2 * 5
        return CGSize(width: itemWidth, height: 150)


    }


}

class FilterByCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var filterCollectionView: UICollectionView!
    var cuisineNames = [String] ()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.filterCollectionView.delegate = self
        self.filterCollectionView.dataSource = self
        cuisineNames = ["one","two","three"]
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cuisineNames.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: FilterCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCollectionViewCell", for: indexPath) as? FilterCollectionViewCell
        {
            cell.viewBudget.layer.cornerRadius = 10
            cell.viewBudget.clipsToBounds = true
            cell.viewBudget.layer.borderWidth = 1
            cell.viewBudget.layer.borderColor = UIColor.black.cgColor
            cell.lblBudget.text = cuisineNames[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (collectionView.bounds.width / 3) - 2 * 5
        return CGSize(width: itemWidth, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        switch kind {
//
//        case UICollectionView.elementKindSectionHeader:
//
//            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath)
//
////            headerView.backgroundColor = UIColor.blue
//            return headerView
//
//        default:
//
//            assert(false, "Unexpected element kind")
//        }
//    }
    
}
class TopCuisinesCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {


    @IBOutlet weak var topCuisinesCollection: UICollectionView!
    var cuisineNames = [String] ()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.topCuisinesCollection.delegate = self
        self.topCuisinesCollection.dataSource = self
       cuisineNames = ["Snacks","Sandwitches","Pizza","Chineese","Burger"]
       // imageArray = ["relevance.png","rating.png","deliveryTime.png","freeDelivery.png","minimumOrder.png"]
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cuisineNames.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: TopCuisinesCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCuisinesCollectionViewCell", for: indexPath) as? TopCuisinesCollectionViewCell
        {
            cell.viewItems.layer.cornerRadius = 10
            cell.viewItems.clipsToBounds = true
            cell.viewItems.layer.borderWidth = 1
            cell.viewItems.layer.borderColor = UIColor.black.cgColor
            cell.lblItems.text = cuisineNames[indexPath.row]
           // cell.imgItems.image = UIImage(named: imageArray[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let itemsPerRow:CGFloat = 3
        let hardCodedPadding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - 2 * itemsPerRow
        let itemHeight = (collectionView.bounds.height / 2) - hardCodedPadding
        
        return CGSize(width: itemWidth, height: itemHeight)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
}
class AllCuisinesCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var allCuisinesCollection: UICollectionView!
    
    var dishesNames = [String] ()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.allCuisinesCollection.delegate = self
        self.allCuisinesCollection.dataSource = self
        
        dishesNames = ["Relevance","Rating","Delivery Time","Delivery Free","Minimum Order"]
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dishesNames.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: AllCuisinesCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllCuisinesCollectionViewCell", for: indexPath) as? AllCuisinesCollectionViewCell
        {
            cell.viewDishes.layer.cornerRadius = 10
            cell.viewDishes.clipsToBounds = true
            cell.viewDishes.layer.borderWidth = 1
            cell.viewDishes.layer.borderColor = UIColor.black.cgColor
            cell.lblDishes.text = dishesNames[indexPath.row]
            return cell
           
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemsPerRow:CGFloat = 3
        let hardCodedPadding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - 2 * itemsPerRow
        let itemHeight = (collectionView.bounds.height / 2) - hardCodedPadding
        
        return CGSize(width: itemWidth, height: itemHeight)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
}
class SortCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgSortItems: UIImageView!
    
    @IBOutlet weak var lblSortItems: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

class FilterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewBudget: UIView!
    
    @IBOutlet weak var lblBudget: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

class TopCuisinesCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var viewItems: UIView!
    
    @IBOutlet weak var lblItems: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

class AllCuisinesCollectionViewCell: UICollectionViewCell {    
    
    @IBOutlet weak var viewDishes: UIView!
    @IBOutlet weak var lblDishes: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
