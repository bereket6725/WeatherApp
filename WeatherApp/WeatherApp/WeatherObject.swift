//
//  WeatherObject.swift
//  WeatherApp
//
//  Created by Bereket Ghebremedhin on 12/24/16.
//  Copyright © 2016 Bereket Ghebremedhin. All rights reserved.
//

import Foundation

//model for our five day forecast
struct WeatherObject: Parsable{
    //date
    let date:      Int
    //temperature
    let min:     Int
    let max:     Int
    let morn:    Int
    let day:     Int
    let night:   Int
    let speed:   Float
    let Humidity:Float
    //description of weather (e.g. rainy, cloudy, sunny etc...)
    let main:    String
    
    typealias JSONStandard = [String:AnyObject]
    static func parseJSON(data: Data)->[WeatherObject] {
        var parsedArray: [WeatherObject] = []
        
        do{
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! JSONStandard
            guard let forecasts = json["list"] else {
                print("problems pulling array out of JSON")
                return parsedArray
            }
            guard let forecastArray = forecasts as? [[String:AnyObject]] else {
                print("error")
                return parsedArray
            }
            for forecast in forecastArray{
                if let speed = forecast["speed"] as? Float {
                    if let humidity = forecast["humidity"] as? Float {
                        if let weatherDate = forecast["dt"] as? Int{
                            if let tempDict = forecast["temp"] as? NSDictionary {
                                if let weather = forecast["weather"] as? NSArray{
                                    if let mainWeather = (weather[0] as! NSDictionary).object(forKey: "main") as? String {
                                        let weatherObj = WeatherObject(date: weatherDate, min: tempDict.object(forKey: "min") as! Int, max: tempDict.object(forKey: "max") as! Int, morn: tempDict.object(forKey: "morn") as! Int, day: tempDict.object(forKey: "day") as! Int, night: tempDict.object(forKey: "night") as! Int, speed: speed, Humidity: humidity, main: mainWeather)
                                        parsedArray.append(weatherObj)
                                    }
                                }
                            }
                            
                        }
                    }
                }
                
            }
        }
        catch{
            print("\(error.localizedDescription)")
        }
        return parsedArray
        
    }
}
