//
//  CarControlService.swift
//  CarService
//
//  Created by Harutyun Shamyan on 26.05.22.
//

import Foundation

class CarControlService: ControlService {

    func lockDoors(completion: @escaping (ControlServiceError?) -> Void) {
        // TODO: Implement API call for lock the doors
        DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
            completion(nil)
        }
    }

    func unlockDoors(completion: @escaping (ControlServiceError?) -> Void) {
        // TODO: Implement API call for unlock the doors
        DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
            completion(nil)
        }
    }

    func startEngine(completion: @escaping (ControlServiceError?) -> Void) {
        completion(nil)
    }

    func stopEngine(completion: @escaping (ControlServiceError?) -> Void) {
        completion(nil)
    }

}
