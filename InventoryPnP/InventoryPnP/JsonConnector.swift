//
//  JsonConnector.swift
//  InventoryPnP
//
//  Created by Krueger Nicolai on 29/05/16.
//  Copyright © 2016 Krueger Nicolai. All rights reserved.
//

import Foundation

func jsonGetSets() {
    
    let url = NSURL(string: "http://tico-kk.eu/phptry/api.php?getSet")
    let data = NSData(contentsOfURL: url!)
    
    do {
        
        if let data = data {
            
            sets = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as! NSArray
            
            print(sets)
            
        } else {
            
            print("no data")
            
        }
        
    } catch let error as NSError {
        
        print(error)
        
    }
    
}

func jsonPostItem(urlTrailer: String) -> Bool {
    
    let fullUrlTrailer = "Category=\(category)&\(urlTrailer)"
    
    let url = NSURL(string: "http:/tico-kk.eu/api.php?postItem&\(fullUrlTrailer)")
    let request = NSMutableURLRequest(URL: url!)
    
    let session = NSURLSession.sharedSession()
    
    let postString:NSString = "postItem&\(fullUrlTrailer)"
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

func jsonFilterItems(keyword: String) -> Bool {
    
    let url = NSURL(string: "http:/tico-kk.eu/api.php?getComp&keywords=\(keyword)")
    let request = NSMutableURLRequest(URL: url!)
    let session = NSURLSession.sharedSession()
    
    let postString:NSString = "getComp&keywords=\(keyword)"
    let postData = postString.dataUsingEncoding(NSASCIIStringEncoding)!
    
    request.HTTPMethod = "POST"
    request.HTTPBody = postData
    request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData
    
    let semaphore = dispatch_semaphore_create(0)
    
    print("URL: \(url)")
    
    let task = session.dataTaskWithRequest(request) {
        
        (let data, let response, let error) in
        
        guard let _:NSData = data, let _:NSURLResponse = response  where error == nil else {
            
            print("DATA TASK ERROR \(error)")
            return
            
        }
        
        dispatch_semaphore_signal(semaphore)
        
        let dataString = NSString(data: data!, encoding: NSUTF8StringEncoding)
        
        do {
            
            if let data = data {
                
                items = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as! NSArray
                
                let descriptor: NSSortDescriptor = NSSortDescriptor(key: "Fullname", ascending: true)
                sortedResults = items.sortedArrayUsingDescriptors([descriptor])
                
            } else {
                
                print("no data")
                
            }
            
        } catch let error as NSError {
            
            print("POST PHP ERROR: \(error)")
            
        }
        
        print("DATA STRING: \(dataString)")
        print("RESPONSE: \(response)")
        
    }
    
    task.resume()
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
    
    return true
    
}