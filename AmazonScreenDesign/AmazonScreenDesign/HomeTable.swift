//
//  HomeTable.swift
//  AmazonScreenDesign
//
//  Created by Raghu ram mahathi on 22/01/19.
//  Copyright © 2019 Raghu ram mahathi. All rights reserved.
//

import UIKit

class HomeTable: UITableView , UITableViewDelegate,UITableViewDataSource{
    
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
       if row == 0 {
            let featuredCell = tableView.dequeueReusableCell(withIdentifier: "FeaturedCell") as! FeaturedCell
            return featuredCell
            
        } else {
            let categoryCell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as! CategoryCell
            return categoryCell
        }
        
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
