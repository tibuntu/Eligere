//
//  JsonConnector.swift
//  InventoryPnP
//
//  Created by Krueger Nicolai on 29/05/16.
//  Copyright © 2016 Krueger Nicolai. All rights reserved.
//

import Foundation



class jsonConnector {

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
    
    print("Posting item (URL: \(url))...")

    let task = session.dataTaskWithRequest(request)
    
    task.resume()
    
    return true
    
}

func jsonEditItem(urlTrailer: String) -> Bool {
    
    let fullUrlTrailer = "keywords=\(category)&\(urlTrailer)"
    
    let url = NSURL(string: "http:/tico-kk.eu/api.php?editItem&\(fullUrlTrailer)")
    let request = NSMutableURLRequest(URL: url!)
    
    let session = NSURLSession.sharedSession()
    
    let postString:NSString = "editItem&\(fullUrlTrailer)"
    let postData = postString.dataUsingEncoding(NSASCIIStringEncoding)!
    
    request.HTTPMethod = "POST"
    request.HTTPBody = postData
    request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData
    
    print("Editing item (URL: \(url))...")
    
    let task = session.dataTaskWithRequest(request)
    
    task.resume()
    
    return true
    
}

func jsonFilterItems(keyword: String, completion: (result: String) -> Void) {
    
    let url = NSURL(string: "http:/tico-kk.eu/api.php?getComp&keywords=\(keyword)&setid=\(setId)")
    let request = NSMutableURLRequest(URL: url!)
    let session = NSURLSession.sharedSession()
    
    let postString:NSString = "getComp&keywords=\(keyword)&setid=\(setId)"
    let postData = postString.dataUsingEncoding(NSASCIIStringEncoding)!
    
    request.HTTPMethod = "POST"
    request.HTTPBody = postData
    request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData
    
    print("Loading items (URL: \(url))...")
    
    sortedItems = []
    items = []
    
    let semaphore = dispatch_semaphore_create(0)
    
    let task = session.dataTaskWithRequest(request) {
        
        (let data, let response, let error) in
        
        guard let _:NSData = data, let _:NSURLResponse = response  where error == nil else {
            
            print("FAILED LOADING DATA (PHP ERROR):")
            print(error)
            
            dispatch_semaphore_signal(semaphore)
            
            return
            
        }
        
        //dispatch_semaphore_signal(semaphore)
        
        do {
            
            if let data = data {
                
                items = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as! NSArray
                
                let descriptor: NSSortDescriptor = NSSortDescriptor(key: "Fullname", ascending: true)
                
                sortedItems = items.sortedArrayUsingDescriptors([descriptor])
                
            } else {
                
                print("LOADING DATA FAILED (NO DATA):")
                print(data)
                
            }
            
            dispatch_semaphore_signal(semaphore)
            
        } catch let error as NSError {
            
            print("LOADING DATA FAILED (POST PHP ERROR):")
            print(error)
            
            dispatch_semaphore_signal(semaphore)
            
        }
        
        print("Response: \(response)")
        
        completion(result: "loaded data")
        
    }
    
    task.resume()
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
    
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
                
                if mode != "" && tmpCategory["Name"] as! String == "All" {
                        
                        // Do nothing
                        
                } else {
                    
                    print("Append \(tmpCategory["Name"] as! String)")
                    categorys.append(tmpCategory["Name"] as! String)
                        
                }
                
            }
            
        } else {
            
            print("no data")
            
        }
        
    } catch let error as NSError {
        
        print(error)
        
    }
    
    return true
    
    }
    
}