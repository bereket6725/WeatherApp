//
//  StringExtenstion.swift
//  WeatherApp
//
//  Created by Bereket Ghebremedhin on 1/9/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation

typealias CatFact = String

extension CatFact: Parsable {
    typealias JSONStandard = [String:AnyObject]
    static func parseJSON(data: Data) -> [String] {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! JSONStandard
            guard let parsedArray = json["facts"] else {
                print("issues getting JSON from cat data")
                return []
            }
            if let parsedArray = parsedArray as? [String] {
                return parsedArray
            }
        } catch {
            print("\(error.localizedDescription)")
        }
        return []
    }

}
