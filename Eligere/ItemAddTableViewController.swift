//
//  ItemAddTableViewController.swift
//  InventoryPnP
//
//  Created by Krueger Nicolai on 04/06/16.
//  Copyright © 2016 Krueger Nicolai. All rights reserved.
//

import UIKit

class ItemAddTableViewController: UITableViewController {

    let categorys = [] .last
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var categoryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Building view...")
        
        if category != "" && category != "All" {
            
            self.categoryButton.setTitle(category, for: UIControlState())
            
        } else {
            
            self.categoryButton.setTitle("Choose category", for: UIControlState())
            
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return setData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ItemAddTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemAddTableViewCell", for: indexPath) as! ItemAddTableViewCell

        cell.nameLabel.text = setData[indexPath.row]
        
        if mode == "editItem" {
            
            print("Building cells...")
            
            let selectItem = selectedItem[setData[indexPath.row]] as? String
            
            if selectItem != nil {
                
                cell.insertTextField.text = selectItem
                
            }
            
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if sender as AnyObject === saveButton {
            
            var index = 0
            
            for value in setData {
                
                let indexPath = IndexPath(row: index, section: 0)
                
                let cell = self.tableView.cellForRow(at: indexPath) as! ItemAddTableViewCell
            
                if postURL != "" { postURL += "&" }
            
                var valueString = cell.insertTextField.text!
                
                valueString = valueString.replacingOccurrences(of: " ", with: "+")
                
                postURL += "\(value)=\(valueString)"
            
                index += 1
                
            }
            
        }
        
    }
    

    
    
}
