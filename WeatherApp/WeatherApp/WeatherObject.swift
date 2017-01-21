//
//  WeatherObject.swift
//  WeatherApp
//
//  Created by Bereket Ghebremedhin on 12/24/16.
//  Copyright © 2016 Bereket Ghebremedhin. All rights reserved.
//

import Foundation

//model for our five day forecast
struct WeatherObject: Parsable {
    //date
    let date: Int
    //temperature
    let min: Int
    let max: Int
    let morn: Int
    let day: Int
    let night: Int
    let speed: Float
    let humidity: Float
    //description of weather (e.g. rainy, cloudy, sunny etc...)
    let main: String

    typealias JSONStandard = [String:AnyObject]
    static func parseJSON(data: Data) -> [WeatherObject] {

        guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! JSONStandard else {
            print("Could not parse JSON")
            return []
        }

        guard let forecasts = json["list"] as? [[String : AnyObject]] else {
            print("Unexpected JSON format")
            return []
        }

        var results: [WeatherObject] = []

        for forecast in forecasts {
            if let speed = forecast["speed"] as? Float,
                let humidity = forecast["humidity"] as? Float,
                let weatherDate = forecast["dt"] as? Int,
                let tempDict = forecast["temp"] as? NSDictionary,
                let weather = forecast["weather"] as? NSArray,
                let mainWeather = (weather[0] as! NSDictionary).object(forKey: "main") as? String {
                let weatherObj = WeatherObject(date: weatherDate, min: tempDict.object(forKey: "min") as! Int, max: tempDict.object(forKey: "max") as! Int, morn: tempDict.object(forKey: "morn") as! Int, day: tempDict.object(forKey: "day") as! Int, night: tempDict.object(forKey: "night") as! Int, speed: speed, humidity: humidity, main: mainWeather)

                results.append(weatherObj)
            }
        }

        return results
    }
}
