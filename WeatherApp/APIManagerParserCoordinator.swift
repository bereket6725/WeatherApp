//
//  APIManagerParserCoordinator.swift
//  WeatherApp
//
//  Created by Bereket Ghebremedhin on 1/3/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation


class APIManagerParserCoordinator {
    //determines which parser the manager should send its info to using the managers parserID"
    static func connectToParser<T>(ID:(data: Data, parserTupleID: ParserID), completion:@escaping (([T])->Void) ){
        let parserID = ID
        
        switch(parserID.parserTupleID){
        case .CatFacts:
          return  CatFactsSerializerAndParser.serializeAndParseJSON(data: parserID.data){ catFactsArray in
                completion(catFactsArray)
            }
        case .FiveDayForeCast:
          return  ForecastSerializerAndParser.serializeAndParseJSON(data: parserID.data){ parsedArray in
                completion(parsedArray)
        }
        
    }
    
    }
}
