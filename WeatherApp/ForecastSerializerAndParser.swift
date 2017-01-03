//
//  ForecastSerializerAndParser.swift
//  WeatherApp
//
//  Created by Bereket Ghebremedhin on 12/30/16.
//  Copyright © 2016 Bereket Ghebremedhin. All rights reserved.
//

import Foundation

class ForecastSerializerAndParser:parserProtocol {
    typealias JSONStandard = [String:AnyObject]
    
   static func serializeAndParseJSON<T>(data: Data, completion: @escaping (_ parsedArray: [T])->Void){
        var parsedArray: [T] = []
        
        do{
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! JSONStandard
            //print("\(json)")
            guard let forecasts = json["list"] else {
                print("problems pulling array out of JSON")
                return
            }
            guard let forecastArray = forecasts as? [[String:AnyObject]] else {
                print("error")
                return
            }
            for forecast in forecastArray{
                if let speed = forecast["speed"] as? Float {
                    //print("speed is \(speed)")
                    if let humidity = forecast["humidity"] as? Float {
                        //  print("humidity is \(humidity)")
                        if let weatherDate = forecast["dt"] as? Int{
                            // print("date is \(weatherDate)")
                            if let tempDict = forecast["temp"] as? NSDictionary {
                                //  print("\(tempDict)")
                                if let weather = forecast["weather"] as? NSArray{
                                    if let mainWeather = (weather[0] as! NSDictionary).object(forKey: "main") as? String {
                                        // print("\(mainWeather)")
                                        let weatherObj = WeatherObject(dt: weatherDate, min: tempDict.object(forKey: "min") as! Int, max: tempDict.object(forKey: "max") as! Int, morn: tempDict.object(forKey: "morn") as! Int, day: tempDict.object(forKey: "day") as! Int, night: tempDict.object(forKey: "night") as! Int, speed: speed, Humidity: humidity, main: mainWeather)
                                        parsedArray.append(weatherObj as! T)
                                    }
                                }
                            }
                            
                        }
                    }
                }
                
            }
            //print("\(fiveDayForecast)")
            completion(parsedArray)
        }
        catch{
            return
        }
    }

    
    
}
