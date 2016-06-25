//
//  ItemAddTableViewController.swift
//  InventoryPnP
//
//  Created by Krueger Nicolai on 04/06/16.
//  Copyright © 2016 Krueger Nicolai. All rights reserved.
//

import UIKit

class ItemAddTableViewController: UITableViewController {
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
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
                
            print(postURL)
            
        }
        
    }
    

    
    
}
