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
    var weatherArray:[WeatherObject]?
    var catFactsArray: [String]?
    
    //delegate method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell") as? WeatherTableViewCell{
            if let weatherArray = weatherArray {
                //converts the date we get from the API to something readable
                let dateInteger = weatherArray[indexPath.row].date/1000
                let currentDate = Date(timeIntervalSince1970: TimeInterval(dateInteger))
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMM dd,yyyy"
                let formattedDate = dateFormatter.string(from: currentDate)
                //casts properties of the Weather array to their appropriate type and presents them to their corresponding cell
                cell.minLabel.text       = "min" + String(describing: weatherArray[indexPath.row].min)
                cell.maxLabel.text       = "max" + String(describing: weatherArray[indexPath.row].max)
                cell.dateLabel.text     = formattedDate
                cell.morningLabel.text   = String(describing: weatherArray[indexPath.row].morn)
                cell.dayLabel.text       = String(describing: weatherArray[indexPath.row].day)
                cell.humidityLabel.text  = String(describing: weatherArray[indexPath.row].Humidity)
                cell.mainLabel.text     = weatherArray[indexPath.row].main
                cell.nightLabel.text    = String(describing: weatherArray[indexPath.row].night)
                cell.speedLabel.text    = String(describing: weatherArray[indexPath.row].speed)
                //network requests will return at undetermined times, so here we are only filling in the TextView when we know have cat facts
                if let catFactsArray = catFactsArray {
                    if catFactsArray.count > 0 {
                        cell.catFactTextView.text = catFactsArray[indexPath.row]
                    }
                }
                //guarantee that the background image will hold a picture in case none of our images match the what the "main" is from our array
                if let pusheenImage = UIImage(named:cell.mainLabel.text!){
                    cell.backgroundPusheenImage.image = pusheenImage
                }
                else{
                    cell.backgroundPusheenImage.image = UIImage(named: "default")
                }
                return cell
            }
            else{
                print("error")
                return UITableViewCell()
            }
        }
        else{
            print("error matching cells to array values")
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 250.00//Choose your custom row height
    }
    
    
    
    
}
