//
//  ItemTableViewController.swift
//  InventoryPnP
//
//  Created by Krueger Nicolai on 29/05/16.
//  Copyright © 2016 Krueger Nicolai. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jsonReceiveItems()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ItemTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ItemTableViewCell
        let item = items[indexPath.row]
        
        cell.idLabel.text = item["id"] as? String
        cell.nameLabel.text = item["fullname"] as? String
        
        return cell
    }
    
    //MARK: - Actions
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedItem = indexPath.row
        
    }    
    
    //MARK: - Navigation
    
    @IBAction func cancelToItemTable(segue: UIStoryboardSegue) {
        
        
        
    }
    
    @IBAction func saveItemToDB(segue: UIStoryboardSegue) {
        
        jsonInsertItem(itemName)
        
    }    
    
}
