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
    func testWeatherParserWorksWithCorrectData() {
        let weatherTestBundle = Bundle(for: ParserUnitTests.self)
        if let url = weatherTestBundle.url(forResource: "CorrectWeather", withExtension: "json") {
            let JSONData = try! Data(contentsOf: url)//<--doesnt need error handling because we want to see if this will fail
            ForecastSerializerAndParser.serializeAndParseJSON(data: JSONData) { (results: [WeatherObject]) in
                print("Weather Result:", results)
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
            return
        }
        XCTFail()
    }

    func testCatFactsParserWorksWithCorrectData() {
        let catFactsTestBundle = Bundle(for: ParserUnitTests.self)
        if let url = catFactsTestBundle.url(forResource: "CorrectCatFacts", withExtension: "json") {
            let JSONData = try! Data(contentsOf: url)
            CatFactsSerializerAndParser.serializeAndParseJSON(data: JSONData) { (results: [String]) in
                print("Cat Fact Result:", results)
                XCTAssertTrue(results[0] == "Cats have 30 vertebrae (humans have 33 vertebrae during early development; 26 after the sacral and coccygeal regions fuse)")
            }
            return
        }
        XCTFail()
    }
}
