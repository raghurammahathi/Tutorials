//
//  FilterViewController.swift
//  DesignDirectoryScreen
//
//  Created by SunarcMac on 19/12/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import UIKit

var sortImages = ["relevance.png","rating.png","deliveryTime.png","freeDelivery.png","minimumOrder.png"]
var sortNames = ["Relevance","Rating","Delivery Time","Delivery Free","Minimum Order"]
var budgetNames = ["one","two","three"]
var topCuisineNames = ["Snacks","Sandwitches","Pizza","Ice creams","Coffee"]
var allCuisineNames = ["Snacks","Sandwitches","Pizza"]

class FilterViewController: UIViewController {

    @IBOutlet weak var tableFilter: UITableView!
    @IBOutlet weak var btnShowRest: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension FilterViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0:
            if sortImages.count == 0{
            return 0
            }else{
                return 100
            }
        case 1:
        if indexPath.row == 0{
            if budgetNames.count == 0{
                return 0
            }else{
                return 81
            }
        }

        if indexPath.row == 1{
            if topCuisineNames.count == 0{
                return 0
            }else{
                return 130
            }
        }

        if indexPath.row == 2{
            if allCuisineNames.count == 0{
                return 0
            }else{
                return 1132
            }
        }

        default:
            return 0
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
            let sortByCell = tableView.dequeueReusableCell(withIdentifier: "SortyByCell", for: indexPath) as! SortyByCell
            return sortByCell
        case 1:
            if indexPath.row == 0 {
            let budgetCell = tableView.dequeueReusableCell(withIdentifier: "BudgetCell") as! BudgetCell
            return budgetCell
            }
            if indexPath.row == 1 {
            let topCuisinesCell = tableView.dequeueReusableCell(withIdentifier: "TopCuisinesCell") as! TopCuisinesCell
            return topCuisinesCell
            }
            if indexPath.row == 2 {
             let allCuisinesCell = tableView.dequeueReusableCell(withIdentifier: "AllCuisinesCell") as! AllCuisinesCell
                return allCuisinesCell
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
}



class SortyByCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var sortCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.sortCollectionView.delegate = self
        self.sortCollectionView.dataSource = self
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sortImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let sortCollectionCell: SortCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SortCollectionCell", for: indexPath) as? SortCollectionCell
        {
            
            sortCollectionCell.imgSortItems.image = UIImage(named: sortImages[indexPath.row])
            sortCollectionCell.lblSortItems.text = sortNames[indexPath.row]
            return sortCollectionCell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (collectionView.bounds.width / 5) - 2 * 5
        return CGSize(width: itemWidth, height: collectionView.frame.height)
    }
}

class BudgetCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var budgetCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.budgetCollectionView.delegate = self
        self.budgetCollectionView.dataSource = self
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return budgetNames.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        

        
        if let budgetCollectionCell: BudgetCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BudgetCollectionCell", for: indexPath) as? BudgetCollectionCell
        {
            budgetCollectionCell.viewBudget.layer.cornerRadius = 10
            budgetCollectionCell.viewBudget.clipsToBounds = true
            budgetCollectionCell.viewBudget.layer.borderWidth = 1
            budgetCollectionCell.viewBudget.layer.borderColor = UIColor.black.cgColor
            budgetCollectionCell.lblBudget.text = budgetNames[indexPath.row]
            return budgetCollectionCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (collectionView.bounds.width / 3) - 2 * 5
        return CGSize(width: itemWidth, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
}

class TopCuisinesCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {


    @IBOutlet weak var topCuisinesCollection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.topCuisinesCollection.delegate = self
        self.topCuisinesCollection.dataSource = self

    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topCuisineNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let topCuisinesCollectionCell: TopCuisinesCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCuisinesCollectionCell", for: indexPath) as? TopCuisinesCollectionCell
        {
            // later u need to replace this with coregraphics, i will let u know how to do this later
            topCuisinesCollectionCell.viewItems.layer.cornerRadius = 10
            topCuisinesCollectionCell.viewItems.clipsToBounds = true
            topCuisinesCollectionCell.viewItems.layer.borderWidth = 1
            topCuisinesCollectionCell.viewItems.layer.borderColor = UIColor.black.cgColor
            topCuisinesCollectionCell.lblItems.text = topCuisineNames[indexPath.row]
            return topCuisinesCollectionCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let coloumns:CGFloat = 3
        let padding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / coloumns) - 2 * coloumns
        let itemHeight = (collectionView.bounds.height / 2) - padding
        
        return CGSize(width: itemWidth, height: itemHeight)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}
class AllCuisinesCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var allCuisinesTableView: UITableView!
    var allCuisinesArray: [Int8] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        allCuisinesTableView.delegate = self
        allCuisinesTableView.dataSource = self
        allCuisinesArray = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCuisinesArray.count     }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let allCuisinesTableCell = tableView.dequeueReusableCell(withIdentifier: "AllCuisinesTableCell", for: indexPath) as! AllCuisinesTableCell
        
        return allCuisinesTableCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 42
    }

}


class AllCuisinesTableCell:UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var allCuisinesCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.allCuisinesCollectionView.delegate = self
        self.allCuisinesCollectionView.dataSource = self
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allCuisineNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let allCuisinesCollectionCell: AllCuisinesCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllCuisinesCollectionCell", for: indexPath) as? AllCuisinesCollectionCell
        {
            allCuisinesCollectionCell.viewItems.layer.cornerRadius = 10
            allCuisinesCollectionCell.viewItems.clipsToBounds = true
            allCuisinesCollectionCell.viewItems.layer.borderWidth = 1
            allCuisinesCollectionCell.viewItems.layer.borderColor = UIColor.black.cgColor
            allCuisinesCollectionCell.lblItems.text = allCuisineNames[indexPath.row]
            return allCuisinesCollectionCell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (collectionView.bounds.width / 3) - 2 * 5
        return CGSize(width: itemWidth, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }

}
class SortCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imgSortItems: UIImageView!
    @IBOutlet weak var lblSortItems: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// below all cells are same y we need to create same again and again, we use single generalized cell
// i tried but couldn't do. please do it for me when u r free
class BudgetCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var viewBudget: UIView!
    @IBOutlet weak var lblBudget: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

class TopCuisinesCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var viewItems: UIView!
    @IBOutlet weak var lblItems: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

class AllCuisinesCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var viewItems: UIView!
    @IBOutlet weak var lblItems: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
