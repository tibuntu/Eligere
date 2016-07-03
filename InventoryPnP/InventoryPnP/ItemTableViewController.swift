//
//  ItemTableViewController.swift
//  InventoryPnP
//
//  Created by Krueger Nicolai on 29/05/16.
//  Copyright © 2016 Krueger Nicolai. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {
    
    @IBOutlet weak var categoryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.categoryButton.setTitle(category, forState: UIControlState.Normal)
        
        let r = jsonConnector()
        
        r.jsonFilterItems(category) {_ in
            
        }
        
        self.refreshControl?.addTarget(self, action: #selector(ItemTableViewController.handleRefresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sortedItems.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ItemTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ItemTableViewCell
        
        let item = sortedItems[indexPath.row]
        
        let imageUrl = "http://tico-kk.eu/images/\(item["Image"] as! String)"
        
        let url = NSURL(string: imageUrl)

        let data = NSData(contentsOfURL: url!)
        
        cell.nameLabel.text = item["Fullname"] as? String
        
        cell.strengthLabel.text = item["Strength"] as? String
        
        cell.itemImage.image = UIImage(data: data!)
        
        return cell
    }
    
    //MARK: - Refresh function
    
    func handleRefresh(refreshControl: UIRefreshControl) {
        
        print("Refreshing...")
        
        let r = jsonConnector()
        
        r.jsonFilterItems(category) {_ in
            
        }
        
        self.tableView.reloadData()
        
        print("...refreshed!")
        
        refreshControl.endRefreshing()
    }
    
    //MARK: - Navigation
    
    @IBAction func cancelToItemTable(segue: UIStoryboardSegue) {
        
        let r = jsonConnector()
        
        r.jsonFilterItems(category) {_ in
            
        }
        
        self.categoryButton.setTitle(category, forState: UIControlState.Normal)
        
        self.tableView.reloadData()
        
    }
    
    @IBAction func saveItemToDB(segue: UIStoryboardSegue) {
        
        if mode == "addItem" {
            
            print("Adding item...")
            
            jsonConnector().jsonPostItem(postURL)
            
        } else if mode == "editItem" {
            
            print("Editing item...")
            jsonConnector().jsonEditItem(postURL)
            
        }
        
        mode = ""
        
        postURL = ""
        
        let r = jsonConnector()
        
        r.jsonFilterItems(category) {_ in
            
        }
        
        self.categoryButton.setTitle(category, forState: UIControlState.Normal)
        
        self.tableView.reloadData()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "editItem" {
            
            mode = "editItem"
            
            if let selectedSetCell = sender as? ItemTableViewCell {
                
                let indexPath = tableView.indexPathForCell(selectedSetCell)!
                selectedItem = items[indexPath.row] as! NSDictionary
                
                print("SELECTED CELL")
                
            }
            
        } else if segue.identifier == "addItem" {
            
            mode = "addItem"
            
        }
        
    }
    
}
