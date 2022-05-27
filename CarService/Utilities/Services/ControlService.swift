//
//  ControlService.swift
//  CarService
//
//  Created by Harutyun Shamyan on 26.05.22.
//

import Foundation

protocol ControlService: AnyObject {
    func lockDoors(completion: @escaping (ControlServiceError?) -> Void)
    func unlockDoors(completion: @escaping (ControlServiceError?) -> Void)
    func startEngine(completion: @escaping (ControlServiceError?) -> Void)
    func stopEngine(completion: @escaping (ControlServiceError?) -> Void)
}
