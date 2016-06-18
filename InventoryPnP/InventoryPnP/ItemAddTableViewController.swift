//
//  ItemAddTableViewController.swift
//  InventoryPnP
//
//  Created by Krueger Nicolai on 04/06/16.
//  Copyright © 2016 Krueger Nicolai. All rights reserved.
//

import UIKit

var linkPhp: String = ""

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
            
            
        }
        
    }
    

    
    
}
