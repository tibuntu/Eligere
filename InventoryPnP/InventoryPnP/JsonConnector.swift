//
//  JsonConnector.swift
//  InventoryPnP
//
//  Created by Krueger Nicolai on 29/05/16.
//  Copyright © 2016 Krueger Nicolai. All rights reserved.
//

import Foundation

func jsonGetItems() {
    
    let url = NSURL(string: "http://tico-kk.eu/api.php?getpost=getItem")
    let data = NSData(contentsOfURL: url!)
    
    print(data?.description)
    
    items = try! NSJSONSerialization.JSONObjectWithData(data!, options:.MutableContainers) as! NSArray
    
}

/*func jsonGetSetData() {
    
    let url = NSURL(string: "http://tico-kk.eu/inventory.php?getpost=getSetData")
    let data = NSData(contentsOfURL: url!)
    
    setData = try! NSJSONSerialization.JSONObjectWithData(data!, options:.MutableContainers) as! NSArray
    
}*/

func jsonPostItem(fullname: String) -> Bool {
    
    let url = NSURL(string: "http:/tico-kk.eu/api.php")
    let request = NSMutableURLRequest(URL: url!)
    
    let session = NSURLSession.sharedSession()
    
    let postString = "a=\(fullname)"
    
    request.HTTPMethod = "POST"
    request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
    request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData
    
    let task = session.dataTaskWithRequest(request)
    
    task.resume()
    
    return true
    
}