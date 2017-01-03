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
    var WeatherArray: [WeatherObject]?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell") as? WeatherTableViewCell{
            cell.dateLabel.text   = "Test"
            cell.morningLabel.text = "Morning"
            cell.dayLabel.text = "day"
            cell.humidityLabel.text = "humidity"
            cell.mainLabel.text = "main"
            cell.nightLabel.text = "night"
            cell.speedLabel.text = "speed"
            return cell
        }
        else{
            print("error matching cells to array values")
            return UITableViewCell()
        }
    }
    


    
}
