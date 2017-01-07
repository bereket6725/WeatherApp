//
//  ParserUnitTests.swift
//  WeatherApp
//
//  Created by Bereket Ghebremedhin on 1/7/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import XCTest
@testable import WeatherApp


class ParserUnitTests: XCTestCase {
    
    //    override func setUp() {
    //
    //    }
    //
    //    override func tearDown() {
    //
    //    }
    func testParserWorksWithCorrectData() {
        let weatherTestBundle = Bundle(for: ParserUnitTests.self)
        if let url = weatherTestBundle.url(forResource: "CorrectWeather", withExtension: "json"){
            //doesnt need error handling
            let JSONData = try! Data(contentsOf: url)
            ForecastSerializerAndParser.serializeAndParseJSON(data: JSONData) { (results: [WeatherObject]) in
                    print("result:",results)
                    XCTAssertTrue(results[0].date == 1483808400)
                    XCTAssertTrue(results[0].min == 20)
                    XCTAssertTrue(results[0].max == 21)
                    XCTAssertTrue(results[0].morn == 20)
                    XCTAssertTrue(results[0].day == 20)
                    XCTAssertTrue(results[0].night == 21 )
                    XCTAssertTrue(results[0].speed == 10.87)
                    XCTAssertTrue(results[0].Humidity == 100)
                    XCTAssertTrue(results[0].main == "Snow")
            }
        }
    }
    
    
}
