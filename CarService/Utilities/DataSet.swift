//
//  DataSet.swift
//  CarService
//
//  Created by Harutyun Shamyan on 25.05.22.
//

import Foundation

final class DataSet {
    private init() { }

    static var qx55: Car {
        get {
            return Car(id: "hlUlasdf125nbsdl8Lhsl",
                     mark: "Infinity",
                    model: "QX55",
                 imageURL: "qx55")
        }
    }

    static var none: Car {
        get {
            return Car(id: "",
                     mark: "",
                    model: "",
                 imageURL: "")
        }
    }
}
