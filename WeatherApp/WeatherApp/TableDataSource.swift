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
    var weatherArray:[WeatherObject]?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let weatherArray = weatherArray {
            return weatherArray.count
        }
        else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell") as? WeatherTableViewCell{
            cell.dateLabel.text      = String(describing: weatherArray?[indexPath.row].dt)
            cell.morningLabel.text   = String(describing: weatherArray?[indexPath.row].morn)
            cell.dayLabel.text       = String(describing: weatherArray?[indexPath.row].day)
            cell.humidityLabel.text   = String(describing: weatherArray?[indexPath.row].Humidity)
            cell.mainLabel.text     = weatherArray?[indexPath.row].main
            cell.nightLabel.text    = String(describing: weatherArray?[indexPath.row].night)
            cell.speedLabel.text    = String(describing: weatherArray?[indexPath.row].speed)
            
            cell.backgroundPusheenImage.image = UIImage(named: cell.mainLabel.text!)
            
            
            return cell
            
        }
        else{
            print("error matching cells to array values")
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 200.00//Choose your custom row height
    }
    
    
    
    
}
