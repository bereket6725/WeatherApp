//
//  ViewController.swift
//  WeatherApp
//
//  Created by Bereket Ghebremedhin on 12/24/16.
//  Copyright © 2016 Bereket Ghebremedhin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        callWeatherAPI(){ parsedArray in
            print("\(parsedArray)\n")
            print("all good")
        }
        callCatFactsAPI(){ catFactsArray in
            print("\(catFactsArray)")
            print("all good ")
        }
        
    }
    
    
    
    
    func callWeatherAPI(completion:@escaping ([WeatherObject])->Void){
        WeatherAPIManager.makeAPICall(completion: completion)
    }
    
    func callCatFactsAPI(completion: @escaping ([String])->Void){
        CatFactsAPIManager.makeAPICall(completion: completion)
        
    }
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

