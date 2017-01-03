//
//  CatFactsSerializerAndParser.swift
//  WeatherApp
//
//  Created by Bereket Ghebremedhin on 1/2/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation


class CatFactsSerializerAndParser{
    typealias JSONStandard = [String:AnyObject]

    static func serializeAndParseJSON(data: Data, completion:@escaping (([String])->Void)){
        
        do{
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! JSONStandard
            guard json["facts"] != nil else {
                print("issues getting JSON from cat data")
                return
            }
            if let catFactsArray = json["facts"] as? NSArray{
                //print("\(catFactsArray)")
                completion(catFactsArray as! [String])
            }
         }
        catch{
            
        }
    }
    
    
    
}
