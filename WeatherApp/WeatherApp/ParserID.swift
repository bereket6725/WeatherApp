//
//  ParserID.swift
//  WeatherApp
//
//  Created by Bereket Ghebremedhin on 12/30/16.
//  Copyright © 2016 Bereket Ghebremedhin. All rights reserved.
//

import Foundation


 enum ParserID{
    case CatFacts
    case FiveDayForeCast
        //determines which parser the manager should send its info to using the managers "parserID"
        static func connectToParser<T>(ID:(data: Data, parserTupleID: ParserID), completion:(([T])->Void) ){
            let parserID = ID
            switch(parserID.parserTupleID){
            case .CatFacts:
                print("catFacts")
            case .FiveDayForeCast:
                print("FiveDayForecast")
            }
            
        }
    
}

