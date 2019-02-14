//
//  OneViewController.swift
//  viewPagerIos
//
//  Created by Raghu ram mahathi on 26/01/19.
//  Copyright © 2019 SunarcMac. All rights reserved.
//

import UIKit

var arr = ["ikuhdfglegn", "kfghlieu", "juhsgikug", "kajsughei;gj", "jkfgreilru"]

class OneViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "Cell") as! Cell
        cell.lbl.text = arr[indexPath.row]
        return cell
    }
    
    
    
    
    

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      //  view.backgroundColor = UIColor.orange
        
//        let newView = UIView()
//        newView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        newView.backgroundColor = UIColor.gray
//        view.addSubview(newView)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
       
        //table.reloadData()
//        let newView2 = UIView()
//        newView2.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
//        newView2.backgroundColor = UIColor.black
//        view.addSubview(newView2)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


class Cell: UITableViewCell {
    

    @IBOutlet weak var lbl: UILabel!
    
}
