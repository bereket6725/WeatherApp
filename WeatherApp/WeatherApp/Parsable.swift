//
//  Parsable.swift
//  WeatherApp
//
//  Created by Bereket Ghebremedhin on 1/9/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation

protocol Parsable {
    static func parseJSON(data: Data) -> [Self]
}
