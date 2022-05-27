//
//  CarDataService.swift
//  CarService
//
//  Created by Harutyun Shamyan on 25.05.22.
//

import Foundation
import UIKit.UIImage

class CarDataService: DataService {

    func getCar(completion: @escaping (Result<Car, DataServiceError>) -> Void) {
        completion(.success(DataSet.qx55))
    }

    func getImage(of car: Car, completion: @escaping (Result<UIImage, DataServiceError>) -> Void) {
        guard let image = UIImage(named: car.imageURL) else {
            completion(.failure(.cantFetchImage))
            return
        }
        completion(.success(image))
    }

    func getMiles(of car: Car, completion: @escaping (Result<Int, DataServiceError>) -> Void) {
        completion(.success(120))
    }
}
