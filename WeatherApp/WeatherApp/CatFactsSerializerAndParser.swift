//
//  CatFactsSerializerAndParser.swift
//  WeatherApp
//
//  Created by Bereket Ghebremedhin on 1/2/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation


class CatFactsSerializerAndParser: parserProtocol{
    typealias JSONStandard = [String:AnyObject]

    static func serializeAndParseJSON<T>(data: Data, completion:@escaping (([T])->Void)){
        
        do{
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! JSONStandard
            guard json["facts"] != nil else {
                print("issues getting JSON from cat data")
                return
            }
            if let parsedArray = json["facts"] as? NSArray{
                //print("\(catFactsArray)")
                completion(parsedArray as! [T])
            }
         }
        catch{
            
        }
    }
    
    
    
}
