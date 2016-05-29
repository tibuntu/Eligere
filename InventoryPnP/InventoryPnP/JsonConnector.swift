//
//  JsonConnector.swift
//  InventoryPnP
//
//  Created by Krueger Nicolai on 29/05/16.
//  Copyright © 2016 Krueger Nicolai. All rights reserved.
//

import Foundation

func jsonReceiveData() {
    
    let itemUrl = NSURL(string: "http://tico-kk.eu/inventory.php")
    let data = NSData(contentsOfURL: itemUrl!)
    
    items = try! NSJSONSerialization.JSONObjectWithData(data!, options:.MutableContainers) as! NSArray
    
}