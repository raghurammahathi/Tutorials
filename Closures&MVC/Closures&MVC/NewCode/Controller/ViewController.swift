//
//  ViewController.swift
//  NewCode
//
//  Created by SunarcMac on 02/10/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tblBlock: UITableView!
    
    var blocks = [Block]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Block.getBlocks({ (blocks) in
            self.blocks = blocks
            self.tblBlock.reloadData()
        }) { (error) in
            print(error)
        }
        
    }

    


}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.blocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let blockCell = tableView.dequeueReusableCell(withIdentifier: "BlockCell")as! BlockCell
        blockCell.block = blocks[indexPath.row]
        return blockCell
    }
    
}









class BlockCell: UITableViewCell {
    
    @IBOutlet weak var lblBlock: UILabel!
    @IBOutlet weak var lblId: UILabel!
    
    @IBOutlet weak var lblNew: UILabel!
    
    var block:Block?{
        didSet {
            if let object = block {
                self.lblBlock.text = object.blockName
                self.lblId.text = object.id
                self.lblNew.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
            }
        }
    }
    
}
