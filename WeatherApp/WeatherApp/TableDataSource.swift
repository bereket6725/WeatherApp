//
//  TableDataSource.swift
//  WeatherApp
//
//  Created by Bereket Ghebremedhin on 1/3/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation
import UIKit


class TableDataSource: NSObject, UITableViewDataSource {
    //gets its values from the TableViewController "makeAPICall" completion parameters
    var weatherArray:[WeatherObject] = []
    var catFactsArray: [String] = []
    
    //delegate method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell") as? WeatherTableViewCell else {
            return UITableViewCell()
        }
        
        let weather = weatherArray[indexPath.row]
        
        //converts the date we get from the API to something readable
        let dateInteger = weather.date / 1000
        let currentDate = Date(timeIntervalSince1970: TimeInterval(dateInteger))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd,yyyy"
        let formattedDate = dateFormatter.string(from: currentDate)
        
        //casts properties of the Weather array to their appropriate type and presents them to their corresponding cell
        cell.minLabel.text = "min: \(weather.min)"
        cell.maxLabel.text = "max: \(weather.max)"
        cell.dateLabel.text = formattedDate
        cell.morningLabel.text = "\(weather.morn)"
        cell.dayLabel.text = "\(weather.day)"
        cell.humidityLabel.text = "\(weather.humidity)"
        cell.mainLabel.text = weather.main
        cell.nightLabel.text = "\(weather.night)"
        cell.speedLabel.text = "\(weather.speed)"
        
        // network requests will return at undetermined times, so here we are only filling in the TextView when we know have cat facts
        if catFactsArray.count > 0 {
            let index = indexPath.row % catFactsArray.count
            cell.catFactTextView.text = catFactsArray[index]
        }
        
        //guarantee that the background image will hold a picture in case none of our images match the what the "main" is from our array
        if let pusheenImage = UIImage(named:cell.mainLabel.text!) {
            cell.backgroundPusheenImage.image = pusheenImage
        } else {
            cell.backgroundPusheenImage.image = UIImage(named: "default")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.00 //Choose your custom row height
    }
}
