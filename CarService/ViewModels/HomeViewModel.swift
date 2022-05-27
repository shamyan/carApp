//
//  HomeViewModel.swift
//  CarService
//
//  Created by Harutyun Shamyan on 23.05.22.
//

import Foundation
import UIKit.UIImage

extension HomeView {
    final class ViewModel: ObservableObject {

        // MARK: Properties

        private let dataService: DataService
        private let controlService: ControlService

        @Published var refreshStatusText: String = ""
        @Published var carModelTitle: String = ""
        @Published var milesTitle: String = ""

        @Published var image: UIImage = UIImage()
        @Published var car: Car = DataSet.none
        @Published var alertItem: AlertItem?

        // MARK: Initializer

        init(dataService: DataService = CarDataService(), controlService: ControlService = CarControlService()) {
            self.dataService = dataService
            self.controlService = controlService
        }

        // MARK: Public functions

        func fetchData() {
            updateRefreshStatusText()
            dataService.getCar { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let car):
                    self.car = car
                    self.updateCarModelTitle()
                    self.getImage(of: car)
                    self.getMiles(of: car)
                case .failure(let error):
                    self.handleServiceError(error)
                }
            }
        }

        func getImage(of car: Car) {
            dataService.getImage(of: car) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let image):
                    self.image = image
                case .failure(let error):
                    self.handleServiceError(error)
                }
            }
        }

        func getMiles(of car: Car) {
            dataService.getMiles(of: car) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let miles):
                    self.milesTitle = "\(miles)mi"
                case .failure(let error):
                    self.handleServiceError(error)
                }
            }
        }

        func lockDoors(_ completion: ((Bool) -> Void)?) {
            controlService.lockDoors { [weak self] error in
                guard let self = self else {
                    completion?(false)
                    return
                }
                if let error = error {
                    self.handleServiceError(error)
                    completion?(false)
                    return
                }
                completion?(true)
            }
        }

        func unlockDoors(_ completion: ((Bool) -> Void)?) {
            controlService.unlockDoors { [weak self] error in
                guard let self = self else {
                    completion?(false)
                    return
                }
                if let error = error {
                    self.handleServiceError(error)
                    completion?(false)
                    return
                }
                completion?(true)
            }
        }

        func startEngine() {
            print("start engine")
        }

        func stopEngine() {
            print("stop engine")
        }

        func updateRefreshStatusText() {
            refreshStatusText = "Updated 1min ago"
        }

        func updateCarModelTitle() {
            carModelTitle = "My \(car.model)"
        }

        // MARK: Private functions

        private func handleServiceError(_ error: ServiceError) {
            alertItem = AlertItem(title: "Error!",
                                message: error.message,
                       destructiveTitle: "OK",
                            applyAction: {})
        }

    }
}
