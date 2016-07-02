//
//  JsonConnector.swift
//  InventoryPnP
//
//  Created by Krueger Nicolai on 29/05/16.
//  Copyright © 2016 Krueger Nicolai. All rights reserved.
//

import Foundation

func jsonGetSets() {
    
    let url = NSURL(string: "http://tico-kk.eu/api.php?getSet")
    let data = NSData(contentsOfURL: url!)
    
    do {
        
        if let data = data {
            
            sets = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as! NSArray
            
        } else {
            
            print("no data")
            
        }
        
    } catch let error as NSError {
        
        print(error)
        
    }
    
}

func jsonPostItem(urlTrailer: String) -> Bool {
    
    let fullUrlTrailer = "keywords=\(category)&\(urlTrailer)"
    
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

func jsonEditItem(urlTrailer: String) -> Bool {
    
    let fullUrlTrailer = "keywords=\(category)&\(urlTrailer)"
    
    let url = NSURL(string: "http:/tico-kk.eu/api.php?editItem&\(fullUrlTrailer)")
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
    
    let url = NSURL(string: "http:/tico-kk.eu/api.php?getComp&keywords=\(keyword)&setid=\(setId)")
    let request = NSMutableURLRequest(URL: url!)
    let session = NSURLSession.sharedSession()
    
    let postString:NSString = "getComp&keywords=\(keyword)&setid=\(setId)"
    let postData = postString.dataUsingEncoding(NSASCIIStringEncoding)!
    
    request.HTTPMethod = "POST"
    request.HTTPBody = postData
    request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData
    
    let semaphore = dispatch_semaphore_create(0)
    
    print("URL: \(url)")
    
    sortedItems = []
    items = []
    
    print("ITEMS DATA BEFORE API: \(items)")
    
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
                
                print("ITEMS IN API: \(items)")
                
                let descriptor: NSSortDescriptor = NSSortDescriptor(key: "Fullname", ascending: true)
                sortedItems = items.sortedArrayUsingDescriptors([descriptor])
                
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

func jsonGetCategory() -> Bool {
    
    let url = NSURL(string: "http://tico-kk.eu/api.php?getKeywords")
    let data = NSData(contentsOfURL: url!)
    
    do {
        
        if let data = data {
            
            let tmpCategorys = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as! NSArray
            
            let descriptor: NSSortDescriptor = NSSortDescriptor(key: "Category", ascending: true)
            let sortedCategorys = tmpCategorys.sortedArrayUsingDescriptors([descriptor])
            
            categorys = []
            
            for value in sortedCategorys {
                
                let tmpCategory = value
                
                if mode == "addItem" && category == "" {
                    
                    if tmpCategory["Name"] as! String == "All" {
                        
                        // Do nothing
                        
                    }
                    
                    else {
                        
                        categorys.append(tmpCategory["Name"] as! String)
                        
                    }
                    
                } else {
                    
                    print("TMP CATEGORY: \(tmpCategory)")
                    
                    if tmpCategory["Name"] as! String == "All" {
                        
                        // Do nothing
                        
                    } else {
                    
                        categorys.append(tmpCategory["Name"] as! String)
                        
                    }
                    
                }
                        
            }
            
            print(categorys)
            
        } else {
            
            print("no data")
            
        }
        
    } catch let error as NSError {
        
        print(error)
        
    }
    
    return true
    
}