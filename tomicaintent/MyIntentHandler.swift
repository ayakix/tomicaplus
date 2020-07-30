//
//  MyIntentHandler.swift
//  tomicaplus
//
//  Created by Ryota Ayaki on 2020/07/30.
//  Copyright © 2020 Ryota Ayaki. All rights reserved.
//

import Foundation
import Intents

class MyIntentHandler: NSObject, VehicleIntentHandling {
    func handle(intent: VehicleIntent, completion: @escaping (VehicleIntentResponse) -> Void) {
        UserDefaultUtil.set(vehicle: intent.vehicle)
        completion(VehicleIntentResponse.success(vehicle: intent.vehicle))
    }
    
    func resolveVehicle(for intent: VehicleIntent, with completion: @escaping (VehicleEnumResolutionResult) -> Void) {
        completion(VehicleEnumResolutionResult.success(with: intent.vehicle))
    }
}
