//
//  ViewController.swift
//  ToDo with CoreData Swift
//
//  Created by Karishma on 7/7/18.
//  Copyright © 2018 Brn. All rights reserved.
//

import UIKit
import CoreData

class TodoViewController: UITableViewController,UITextFieldDelegate {
    
    
    
 var itemName : [NSManagedObject] = []
    var nameTF : UITextField!
    
    func nameTF(textfield: UITextField!){
        nameTF = textfield
        nameTF.placeholder = "Item Name"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Items")
        do{
            itemName =  try context?.fetch(fetchRequest) as! [NSManagedObject]
           }catch
           {
          print("Error in Loading Data")
        }
      tableView.reloadData()
  }
    
    @IBAction func addBtn(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: self.save)
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        alert.addTextField(configurationHandler: nameTF)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //Saving Items
    
    func save(alert: UIAlertAction){
       let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        let nameentity = NSEntityDescription.entity(forEntityName: "Items", in: context!)
        let name = NSManagedObject(entity: nameentity!, insertInto: context)
        name.setValue(nameTF.text, forKey: "name")
        
        do{
            
            try context?.save()
            itemName.append(name)
            
        }catch {
            
            print("Error saving item")
            
        }
        
        tableView.reloadData()
        
    }

    
    //DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemName.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        let nme = itemName[indexPath.row]
        cell.textLabel?.text = nme.value(forKey: "name") as? String
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            let context = appDelegate?.persistentContainer.viewContext
         context?.delete(itemName[indexPath.row])
            itemName.remove(at: indexPath.row)
        
        
        do{
            
            try context?.save()
           
            
        }catch {
            
            print("Error in entity")
            
        }
        }
        tableView.reloadData()
    }
}

