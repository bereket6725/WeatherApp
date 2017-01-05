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
    //var weatherArray: [WeatherObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: view.bounds)
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        tableView.register(UINib(nibName:"WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "weatherCell")
        tableView.rowHeight = 250.00
        view.addSubview(tableView)
        dataSource = TableDataSource()
        tableView.dataSource = dataSource
        self.dataSource.weatherArray = [WeatherObject]()
        self.dataSource.catFactsArray = [String]()
        tableView.reloadData()
        makeNetworkRequests()
    }
    
    func makeNetworkRequests(){
        callCatFactsAPI(){ catFactsArray in
            print("\(catFactsArray)")
            self.dataSource.catFactsArray = catFactsArray
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
        callWeatherAPI(){ parsedArray in
            print("\(parsedArray)\n")
            print("all good")
            self.dataSource.weatherArray = parsedArray
            DispatchQueue.main.async{
                self.tableView.reloadData()
                
            }
        }
    }
    
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
}
