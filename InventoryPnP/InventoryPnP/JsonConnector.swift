//
//  JsonConnector.swift
//  InventoryPnP
//
//  Created by Krueger Nicolai on 29/05/16.
//  Copyright © 2016 Krueger Nicolai. All rights reserved.
//

import Foundation

func jsonReceiveItems() {
    
    let url = NSURL(string: "http://tico-kk.eu/inventory.php")
    let data = NSData(contentsOfURL: url!)
    
    items = try! NSJSONSerialization.JSONObjectWithData(data!, options:.MutableContainers) as! NSArray
    
}

func jsonInsertItem(fullname: String) -> Bool {
    
    let url = NSURL(string: "http:/tico-kk.eu/create_item.php")
    let request = NSMutableURLRequest(URL: url!)
    let session = NSURLSession.sharedSession()
    
    let postString = "a=\(fullname)"
    
    request.HTTPMethod = "POST"
    request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
    
    let task = session.dataTaskWithRequest(request)
    
    task.resume()
    
    return true
    
}