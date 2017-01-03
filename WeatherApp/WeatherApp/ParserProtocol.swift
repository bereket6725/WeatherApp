//
//  ParserProtocol.swift
//  WeatherApp
//
//  Created by Bereket Ghebremedhin on 1/2/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation


protocol parserProtocol {
    
    static func serializeAndParseJSON<T>(data: Data, completion: @escaping (_ parsedArray: [T])->Void)
}
