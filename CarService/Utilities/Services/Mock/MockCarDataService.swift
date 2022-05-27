//
//  MockCarDataService.swift
//  CarService
//
//  Created by Harutyun Shamyan on 25.05.22.
//

import Foundation
import UIKit.UIImage

final class MockCarDataService: DataService {

    var getCarResult: Result<Car, DataServiceError> = .success(DataSet.qx55)
    var getImageResult: Result<UIImage, DataServiceError> = .success(UIImage())
    var getMilesResult: Result<Int, DataServiceError> = .success(120)

    func getCar(completion: @escaping (Result<Car, DataServiceError>) -> Void) {
        completion(getCarResult)
    }

    func getImage(of car: Car, completion: @escaping (Result<UIImage, DataServiceError>) -> Void) {
        completion(getImageResult)
    }

    func getMiles(of car: Car, completion: @escaping (Result<Int, DataServiceError>) -> Void) {
        completion(getMilesResult)
    }
}
