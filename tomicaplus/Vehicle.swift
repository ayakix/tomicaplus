//
//  Vehicle.swift
//  tomicaplus
//
//  Created by Ryota Ayaki on 2020/05/12.
//  Copyright © 2020 Ryota Ayaki. All rights reserved.
//

import Foundation

enum Vehicle: String, CaseIterable {
    case ambulance
    case bus
    case car
    case f1
    case firetruck
    case helicopter
    case policecar
    case sl
    case sportscar
    
    static func getRandomCase() -> Vehicle {
        return Vehicle.allCases[(Int)(arc4random_uniform(UInt32(Vehicle.allCases.count)))]
    }
    
    var audioPath: URL {
        let path = Bundle.main.path(forResource: rawValue, ofType: "mp3")!
        return URL(fileURLWithPath: path)
    }
}
