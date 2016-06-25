//
//  JsonConnector.swift
//  InventoryPnP
//
//  Created by Krueger Nicolai on 29/05/16.
//  Copyright © 2016 Krueger Nicolai. All rights reserved.
//

import Foundation

func jsonGetItems() {
    
    let url = NSURL(string: "http://tico-kk.eu/phptry/api.php?getpost=getItem")
    let data = NSData(contentsOfURL: url!)
    
    do {
        
        if let data = data {
            
            items = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as! NSArray
            
        } else {
            
            print("no data")
            
        }
        
    } catch let error as NSError {
        
        print(error)
            
    }
    
}

/*func jsonGetSetData() {
    
    let url = NSURL(string: "http://tico-kk.eu/inventory.php?getpost=getSetData")
    let data = NSData(contentsOfURL: url!)
    
    setData = try! NSJSONSerialization.JSONObjectWithData(data!, options:.MutableContainers) as! NSArray
    
}*/

func jsonPostItem(urlTrailer: String) -> Bool {
    
    let url = NSURL(string: "http:/tico-kk.eu/api.php?getpost=postItem&\(urlTrailer)")
    let request = NSMutableURLRequest(URL: url!)
    
    let session = NSURLSession.sharedSession()
    
    let postString:NSString = "getpost=postItem&\(urlTrailer)"
    let postData = postString.dataUsingEncoding(NSASCIIStringEncoding)!
    
    request.HTTPMethod = "POST"
    request.HTTPBody = postData
    request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData
    
    print(request.HTTPBody)
    
    print(url)
    
    let task = session.dataTaskWithRequest(request)
    
    task.resume()
    
    return true
    
}