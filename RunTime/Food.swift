//
//  Food.swift
//  RunTime
//
//  Created by Andy Sun (student LM) on 1/11/22.
//

import Foundation

struct Food {
    
    let headers = [
        "x-rapidapi-host": "edamam-food-and-grocery-database.p.rapidapi.com",
        "x-rapidapi-key": "09efb9c89amshf6806ede7a42469p13a7e0jsnd50f17d892ae"
    ]
    
    let request = NSMutableURLRequest(url: NSURL(string: "https://edamam-food-and-grocery-database.p.rapidapi.com/parser?ingr=apple")! as URL,
        cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error)
        } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse)
        }
    })
    
    dataTask.resume()
    
}
