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
    var counter = 2//used to keep track of completed API requests
    //sets up tableView and calls the function to make the network request
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: view.bounds)
        tableView.register(UINib(nibName:"WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "weatherCell")
        tableView.rowHeight = 250.00
        view.addSubview(tableView)
        dataSource = TableDataSource()
        tableView.dataSource = dataSource
        //sets up the pull to refresh
        let myRefreshControl = UIRefreshControl()
        myRefreshControl.backgroundColor = UIColor.gray
        myRefreshControl.tintColor = UIColor.white
        myRefreshControl.addTarget(self, action: #selector(TableViewController.makeNetworkRequests), for: .valueChanged)
        self.tableView.refreshControl = myRefreshControl
        makeNetworkRequests()
    }

    //calls the API's and assigns returned values to corresponding properties on the data source
    func makeNetworkRequests() {
        callCatFactsAPI { catFactsArray in
            self.dataSource.catFactsArray = catFactsArray
            self.stopRefreshing()
        }
        callWeatherAPI { parsedArray in
            self.dataSource.weatherArray = parsedArray
            print("made API call")
            self.stopRefreshing()
        }
    }
    //function gets called twice by both API requests and decrements our counter
    //when our counter hits zero we know that both API calls have returned and we can refresh the tableView and end the refresh animation
    func stopRefreshing(){
        let decrementCounter = {
            self.counter -= 1
        }
        decrementCounter()
        if self.counter == 0 {
            self.counter = 2
            reloadTableData()
        }

    }
    //reloads tableView and ends refreshing
    func reloadTableData(){
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
            self.tableView.reloadData()
            //self.tableView.refreshControl?.endRefreshing()
        }
    }

    //in case we come up short from our network request
    func showErrorMessage() {
        let alertController = UIAlertController(title: nil, message: "Error Grabbing Weather", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
    //calls the openWeatherMaps API
    func callWeatherAPI(completion:@escaping ([WeatherObject]) -> Void) {
        APIManager.makeAPICall(urlString: Constants.openWeatherMapsAPI.url, completion: { results in
            DispatchQueue.main.async {
                completion(results)
            }
        })

    }
    //calls the catFacts API
    func callCatFactsAPI(completion: @escaping ([String]) -> Void) {
        APIManager.makeAPICall(urlString: Constants.CatFactsAPI.url, completion: completion)
    }
}
