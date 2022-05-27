//
//  ServiceError.swift
//  CarService
//
//  Created by Harutyun Shamyan on 26.05.22.
//

import Foundation

protocol ServiceError: Error {
    var message: String { get }
}

enum DataServiceError: ServiceError {
    case cantFetchCarData
    case cantFetchImage
    case cantFetchMiles

    var message: String {
        switch self {
        case .cantFetchCarData:
            return "Can't fetch data"
        case .cantFetchImage:
            return "Can't fetch image"
        case .cantFetchMiles:
            return "Can't fetch miles"
        }
    }
}

enum ControlServiceError: ServiceError {
    case cantLockTheDoors
    case cantUnlockTheDoors
    case cantStartEngine
    case cantStopEngine

    var message: String {
        switch self {
        case .cantLockTheDoors:
            return "Can't lock the doors"
        case .cantUnlockTheDoors:
            return "Can't unlock the doors"
        case .cantStartEngine:
            return "Can't start engine"
        case .cantStopEngine:
            return "Can't stop engine"
        }
    }
}
