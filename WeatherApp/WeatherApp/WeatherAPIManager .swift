//
//  WeatherAPIManager .swift
//  WeatherApp
//
//  Created by Bereket Ghebremedhin on 12/24/16.
//  Copyright © 2016 Bereket Ghebremedhin. All rights reserved.
//

import Foundation


class WeatherAPIManager: APIManagerProtocol{
    //typealias JSONStandard = [String:AnyObject]
    //makes API call
    static func makeAPICall<T>(completion:@escaping ([T])->Void){
        let parserID: ParserID = .FiveDayForeCast
        let urlString = Constants.openWeatherMapsAPI.url
        guard let url = URL(string: urlString) else {
            print("problem with URL")
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url){ (data, response, error) in
            guard data != nil else {
                print("\(error?.localizedDescription)")
                return
            }
            APIManagerParserCoordinator.connectToParser(ID: (data!, parserID)){ parsedArray in
                completion(parsedArray)
            }
//            ForecastSerializerAndParser.serializeAndParseJSON(data: data!){ parsedArray in
//                completion(parsedArray)
//            }
            //self.FiveDayForecastFromJSON(data: data!)
        }
        task.resume()
    }
    
}
