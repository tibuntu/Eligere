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
    
    let url = URL(string: "http://tico-kk.eu/api.php?getSet")
    let data = try? Data(contentsOf: url!)
    
    do {
        
        if let data = data {
            
            sets = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSArray
            
        } else {
            
            print("no data")
            
        }
        
    } catch let error as NSError {
        
        print(error)
        
    }
    
}

func jsonPostItem(_ urlTrailer: String) -> Bool {
    
    let fullUrlTrailer = "keywords=\(category)&\(urlTrailer)"
    
    let url = URL(string: "http:/tico-kk.eu/api.php?postItem&\(fullUrlTrailer)")
    let request = NSMutableURLRequest(url: url!)
    
    let session = URLSession.shared
    
    let postString:NSString = "postItem&\(fullUrlTrailer)" as NSString
    let postData = postString.data(using: String.Encoding.ascii.rawValue)!
    
    request.httpMethod = "POST"
    request.httpBody = postData
    request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
    
    print("Posting item (URL: \(url))...")

    let task = session.dataTask(with: request)
    
    task.resume()
    
    return true
    
}

func jsonEditItem(_ urlTrailer: String) -> Bool {
    
    let fullUrlTrailer = "keywords=\(category)&\(urlTrailer)"
    
    let url = URL(string: "http:/tico-kk.eu/api.php?editItem&\(fullUrlTrailer)")
    let request = NSMutableURLRequest(url: url!)
    
    let session = URLSession.shared
    
    let postString:NSString = "editItem&\(fullUrlTrailer)" as NSString
    let postData = postString.data(using: String.Encoding.ascii.rawValue)!
    
    request.httpMethod = "POST"
    request.httpBody = postData
    request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
    
    print("Editing item (URL: \(url))...")
    
    let task = session.dataTask(with: request)
    
    task.resume()
    
    return true
    
}

func jsonFilterItems(_ keyword: String, completion: @escaping (_ result: String) -> Void) {
    
    let url = URL(string: "http:/tico-kk.eu/api.php?getComp&keywords=\(keyword)&setid=\(setId)")
    let request = NSMutableURLRequest(url: url!)
    let session = URLSession.shared
    
    let postString:NSString = "getComp&keywords=\(keyword)&setid=\(setId)" as NSString
    let postData = postString.data(using: String.Encoding.ascii.rawValue)!
    
    request.httpMethod = "POST"
    request.httpBody = postData
    request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
    
    print("Loading items (URL: \(url))...")
    
    sortedItems = []
    items = []
    
    let semaphore = DispatchSemaphore(value: 0)
    
    let task = session.dataTask(with: request, completionHandler: {
        
        (data, response, error) in
        
        guard let _:Data = data, let _:URLResponse = response, error == nil else {
            
            print("FAILED LOADING DATA (PHP ERROR):")
            print(error)
            
            semaphore.signal()
            
            return
            
        }
        
        //dispatch_semaphore_signal(semaphore)
        
        do {
            
            if let data = data {
                
                items = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSArray
                
                let descriptor: NSSortDescriptor = NSSortDescriptor(key: "Fullname", ascending: true)
                
                sortedItems = items.sortedArray(using: [descriptor])
                
            } else {
                
                print("LOADING DATA FAILED (NO DATA):")
                print(data)
                
            }
            
            semaphore.signal()
            
        } catch let error as NSError {
            
            print("LOADING DATA FAILED (POST PHP ERROR):")
            print(error)
            
            semaphore.signal()
            
        }
        
        print("Response: \(response)")
        
        completion(result: "loaded data")
        
    }) 
    
    task.resume()
    
    semaphore.wait(timeout: DispatchTime.distantFuture)
    
}

func jsonGetCategory() -> Bool {
    
    let url = URL(string: "http://tico-kk.eu/api.php?getKeywords")
    let data = try? Data(contentsOf: url!)
    
    do {
        
        if let data = data {
            
            let tmpCategorys = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSArray
            
            let descriptor: NSSortDescriptor = NSSortDescriptor(key: "Category", ascending: true)
            let sortedCategorys = tmpCategorys.sortedArray(using: [descriptor])
            
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
