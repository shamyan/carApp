//
//  MockCarControlService.swift
//  CarService
//
//  Created by Harutyun Shamyan on 26.05.22.
//

import Foundation

final class MockCarControlService: ControlService {

    var errorResult: ControlServiceError? = nil

    func lockDoors(completion: @escaping (ControlServiceError?) -> Void) {
        completion(errorResult)
    }

    func unlockDoors(completion: @escaping (ControlServiceError?) -> Void) {
        completion(errorResult)
    }

    func startEngine(completion: @escaping (ControlServiceError?) -> Void) {
        completion(errorResult)
    }

    func stopEngine(completion: @escaping (ControlServiceError?) -> Void) {
        completion(errorResult)
    }
}
