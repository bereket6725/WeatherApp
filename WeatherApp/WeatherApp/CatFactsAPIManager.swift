//
//  CatFactsAPIManager.swift
//  WeatherApp
//
//  Created by Bereket Ghebremedhin on 1/2/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation


class CatFactsAPIManager:APIManagerProtocol{
    
   static func makeAPICall<T>(completion: @escaping (([T])->Void)){
        let parserID: ParserID = .CatFacts
        let urlString = Constants.CatFactsAPI.url
        guard let url = URL(string: urlString) else {
            print("problem with URL")
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url){ (data, response, error) in
            guard data != nil else {
                print("\(error?.localizedDescription)")
                return
            }
            APIManagerParserCoordinator.connectToParser(ID: (data!, parserID)){ catFactsArray in
                completion(catFactsArray)
            }
            
            //print("\(data)")
        }
        task.resume()
        
    }
}




