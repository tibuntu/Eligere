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
        
        jsonGetItems()
        //jsonGetSetData()
        
        self.refreshControl?.addTarget(self, action: #selector(ItemTableViewController.handleRefresh(_:)), forControlEvents: UIControlEvents.ValueChanged)

        
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
        
        let imageUrl = "http://tico-kk.eu/phptry/images/\(item["Image"] as! String)"
        
        print(imageUrl)
        
        let url = NSURL(string: imageUrl)
        
        print(url)
        
        let data = NSData(contentsOfURL: url!)
        
        cell.nameLabel.text = item["Fullname"] as? String
        cell.strengthLabel.text = item["Strength"] as? String
        //cell.itemImage.image = UIImage(data: data!)
        
        return cell
    }
    
    //MARK: - Refresh function
    
    func handleRefresh(refreshControl: UIRefreshControl) {

        jsonGetItems()
        print("Refreshing...")
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    //MARK: - Actions
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //selectedItem = indexPath.row
        
    }
    
    //MARK: - Navigation
    
    @IBAction func cancelToItemTable(segue: UIStoryboardSegue) {
        
        
        
    }
    
    @IBAction func saveItemToDB(segue: UIStoryboardSegue) {
        
        jsonPostItem(postURL)
        
        postURL = ""
        
    }
    
}
