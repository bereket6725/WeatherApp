//
//  APIManagerProtocol.swift
//  WeatherApp
//
//  Created by Bereket Ghebremedhin on 1/2/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation

protocol APIManagerProtocol {
    static func makeAPICall<T:Parsable>(completion: @escaping (([T])->Void))
}
