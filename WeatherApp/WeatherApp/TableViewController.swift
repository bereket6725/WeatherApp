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
    var dataSource: TableDataSource!
    
    //sets up tableView and calls the function to make the network request
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: view.bounds)
        tableView.register(UINib(nibName:"WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "weatherCell")
        tableView.rowHeight = 250.00
        view.addSubview(tableView)
        dataSource = TableDataSource()
        tableView.dataSource = dataSource
        makeNetworkRequests()
    }

    //calls the API's and assigns returned values to corresponding properties on the data source
    func makeNetworkRequests() {
        callCatFactsAPI() { catFactsArray in
            self.dataSource.catFactsArray = catFactsArray
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
        callWeatherAPI() { parsedArray in
            self.dataSource.weatherArray = parsedArray
            self.tableView.reloadData()
            
        }
    }
    
    //in case we come up short from our network request
    func showErrorMessage() {
        let alertController = UIAlertController(title: nil, message: "Error Grabbing Weather", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        DispatchQueue.main.async{
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
    func callWeatherAPI(completion:@escaping ([WeatherObject])->Void){
        APIManager.makeAPICall(urlString: Constants.openWeatherMapsAPI.url, completion: { results in
            DispatchQueue.main.async {
                completion(results)
            }
        })
        
    }
    
    func callCatFactsAPI(completion: @escaping ([String])->Void){
        APIManager.makeAPICall(urlString: Constants.CatFactsAPI.url, completion: completion)
        //TODO: always dispatch to main queue
    }
}
