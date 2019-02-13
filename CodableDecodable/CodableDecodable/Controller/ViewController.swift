//
//  ViewController.swift
//  CodableDecodable
//
//  Created by SunarcMac on 13/02/19.
//  Copyright © 2019 SunarcMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.blocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let blockCell = tableView.dequeueReusableCell(withIdentifier: "BlockCell")as! BlockCell
        blockCell.block = blocks[indexPath.row]
        return blockCell
    }
    

    var blocks = [Block]()
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Block.getBlocks({ (blocks) in
            self.blocks = blocks
            self.table.reloadData()
        }) { (error) in
            print(error)
        }
    }
}

class BlockCell: UITableViewCell {
    
    @IBOutlet weak var lblBlock: UILabel!
    @IBOutlet weak var lblId: UILabel!
    
    
    var block:Block?{
        didSet {
            if let object = block {
                self.lblBlock.text = object.block_name
                self.lblId.text = object.id
                
            }
        }
    }
    
}
