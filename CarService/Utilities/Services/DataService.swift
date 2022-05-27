//
//  DataService.swift
//  CarService
//
//  Created by Harutyun Shamyan on 25.05.22.
//

import Foundation
import UIKit.UIImage

protocol DataService: AnyObject {
    func getCar(completion: @escaping (Result<Car, DataServiceError>) -> Void)
    func getImage(of car: Car, completion: @escaping (Result<UIImage, DataServiceError>) -> Void)
    func getMiles(of car: Car, completion: @escaping (Result<Int, DataServiceError>) -> Void)
}
