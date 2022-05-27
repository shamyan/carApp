//
//  Car.swift
//  CarService
//
//  Created by Harutyun Shamyan on 23.05.22.
//

import Foundation

struct Car: Codable {
    let id: String
    let mark: String
    let model: String
    let imageURL: String
}

extension Car: Equatable {
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.id == rhs.id
    }
}
