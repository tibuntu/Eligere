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
        
        self.categoryButton.setTitle(category, for: UIControlState())
        
        let r = jsonConnector()
        
        r.jsonFilterItems(category) {_ in
            
        }
        
        self.refreshControl?.addTarget(self, action: #selector(ItemTableViewController.handleRefresh(_:)), for: UIControlEvents.valueChanged)
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sortedItems.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ItemTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ItemTableViewCell
        
        let item = sortedItems[indexPath.row] as! [String:AnyObject]
        
        let imageUrl = "http://secret-role.com/images/\(item["Image"] as! String)"
        
        
        let url = URL(string: imageUrl)

        let data = try? Data(contentsOf: url!)
        
        cell.nameLabel.text = item["Fullname"] as? String
        
        cell.strengthLabel.text = (item["Strength"] as! String)
        
        cell.itemImage.image = UIImage(data: data!)
        
        return cell
    }
    
    //MARK: - Refresh function
    
    func handleRefresh(_ refreshControl: UIRefreshControl) {
        
        print("Refreshing...")
        
        let r = jsonConnector()
        
        r.jsonFilterItems(category) {_ in
            
        }
        
        self.tableView.reloadData()
        
        print("...refreshed!")
        
        refreshControl.endRefreshing()
    }
    
    //MARK: - Navigation
    
    @IBAction func cancelToItemTable(_ segue: UIStoryboardSegue) {
        
        let r = jsonConnector()
        
        r.jsonFilterItems(category) {_ in
            
        }
        
        self.categoryButton.setTitle(category, for: UIControlState())
        
        self.tableView.reloadData()
        
    }
    
    @IBAction func saveItemToDB(_ segue: UIStoryboardSegue) {
        
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
        
        self.categoryButton.setTitle(category, for: UIControlState())
        
        self.tableView.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "editItem" {
            
            mode = "editItem"
            
            if let selectedSetCell = sender as? ItemTableViewCell {
                
                let indexPath = tableView.indexPath(for: selectedSetCell)!
                selectedItem = items[indexPath.row] as! NSDictionary
                
                print("SELECTED CELL")
                
            }
            
        } else if segue.identifier == "addItem" {
            
            mode = "addItem"
            
        }
        
    }
    
}
