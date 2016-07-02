//
//  ItemAddTableViewController.swift
//  InventoryPnP
//
//  Created by Krueger Nicolai on 04/06/16.
//  Copyright © 2016 Krueger Nicolai. All rights reserved.
//

import UIKit

class ItemAddTableViewController: UITableViewController {

    let categorys = ["Weapon", "Armor", "Utilities", "Shields", "Ressource"]
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var categoryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if category != "" && category != "All" {
            
            self.categoryButton.setTitle(category, forState: UIControlState.Normal)
            
        } else {
            
            self.categoryButton.setTitle("Choose category", forState: UIControlState.Normal)
            
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return setData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> ItemAddTableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemAddTableViewCell", forIndexPath: indexPath) as! ItemAddTableViewCell

        cell.nameLabel.text = setData[indexPath.row]
        
        if mode == "editItem" {
            
            let selectItem = selectedItem[setData[indexPath.row]] as! String
            
            cell.insertTextField.text = selectItem
            
        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if sender === saveButton {
            
            var index = 0
            
            for value in setData {
                
                let indexPath = NSIndexPath(forRow: index, inSection: 0)
                
                let cell = self.tableView.cellForRowAtIndexPath(indexPath) as! ItemAddTableViewCell
            
                if postURL != "" { postURL += "&" }
            
                var valueString = cell.insertTextField.text!
                
                valueString = valueString.stringByReplacingOccurrencesOfString(" ", withString: "+")
                
                postURL += "\(value)=\(valueString)"
            
                index += 1
                
            }
            
        }
        
    }
    

    
    
}
