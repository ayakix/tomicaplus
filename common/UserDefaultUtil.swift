//
//  UserDefaultUtil.swift
//  tomicaplus
//
//  Created by Ryota Ayaki on 2020/07/30.
//  Copyright © 2020 Ryota Ayaki. All rights reserved.
//

import Foundation

class UserDefaultUtil {
    private static let kGroupName = "group.tomica"
    
    private enum UserDefaultsKey: String {
        case vehicle
    }
    
    static var userDefaults: UserDefaults? {
        return UserDefaults(suiteName: kGroupName)
    }
    
    static func set(vehicle: VehicleEnum) {
        userDefaults?.set(vehicle.rawValue, forKey: UserDefaultsKey.vehicle.rawValue)
        userDefaults?.synchronize()
    }
    
    static func getVehicle() -> Vehicle? {
        if let index = userDefaults?.integer(forKey: UserDefaultsKey.vehicle.rawValue), index > 0 {
            userDefaults?.set(0, forKey: UserDefaultsKey.vehicle.rawValue)
            userDefaults?.synchronize()
            return Vehicle.allCases[index - 1]
        }
        return nil
    }
}
