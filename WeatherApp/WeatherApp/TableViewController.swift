//
//  TableViewController.swift
//  WeatherApp
//
//  Created by Bereket Ghebremedhin on 1/3/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UIViewController, UITableViewDelegate {
    
    var tableView: UITableView!
    var dataSource: UITableViewDataSource!
    //var weatherArray: [WeatherObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: view.bounds)
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        tableView.register(UINib(nibName:"WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "weatherCell")
        view.addSubview(tableView)
        dataSource = TableDataSource()
        tableView.dataSource = dataSource
        tableView.reloadData()
        
        
        makeNetworkRequests()
        
        
    }
    
    func makeNetworkRequests(){
        callWeatherAPI(){ parsedArray in
            print("\(parsedArray)\n")
            print("all good")
           // self.sendOverWeatherObjectArray(weatherArray: parsedArray)
            DispatchQueue.main.async{
                self.tableView.reloadData()
                
            }
            
        }
    }
//    func sendOverWeatherObjectArray(weatherArray: [WeatherObject]){
//        let nc = NotificationCenter.default
//        nc.post(name: Notification.Name(rawValue: "WeatherArray"),
//                object:nil, queue: nil, using:dataSource.catchNotification,  userInfo: ["five day forecast":weatherArray])
//    }
    
    
    
    //        callCatFactsAPI(){ catFactsArray in
    //            print("\(catFactsArray)")
    //            print("all good ")
    //        }
    
    
    
    func showErrorMessage(){
        let alertController = UIAlertController(title: nil, message: "Error Grabbing Weather", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        DispatchQueue.main.async{
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
    func callWeatherAPI(completion:@escaping ([WeatherObject])->Void){
        WeatherAPIManager.makeAPICall(completion: completion)
    }
    
    func callCatFactsAPI(completion: @escaping ([String])->Void){
        CatFactsAPIManager.makeAPICall(completion: completion)
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}
