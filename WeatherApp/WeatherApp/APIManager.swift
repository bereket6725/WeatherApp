//
//  APIManager.swift
//  WeatherApp
//
//  Created by Michael Kavouras on 1/10/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation

class APIManager: APIManagerProtocol {
    static func makeAPICall<T:Parsable>(urlString: String, completion: @escaping (([T])->Void)) {
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
            let result = T.parseJSON(data: data!)
            completion(result)
        }
        task.resume()
    }
}

