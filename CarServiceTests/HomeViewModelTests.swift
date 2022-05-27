//
//  HomeViewModelTests.swift
//  CarServiceTests
//
//  Created by Harutyun Shamyan on 24.05.22.
//

import XCTest
@testable import CarService

class HomeViewModelTests: XCTestCase {

    private var mockControlService: MockCarControlService!
    private var mockDataService:  MockCarDataService!
    private var unit: HomeView.ViewModel!

    private let car: Car = DataSet.qx55

    override func setUp() {
        mockDataService = .init()
        mockControlService = .init()

        unit = .init(dataService: mockDataService,
                  controlService: mockControlService)
    }

    func testGetCarResultForSuccessCase() throws {
        mockDataService.getCarResult = .success(car)

        unit.fetchData()

        XCTAssertEqual(unit.car.id, car.id)
        XCTAssertEqual(unit.car.mark, car.mark)
        XCTAssertEqual(unit.car.model, car.model)
        XCTAssertEqual(unit.car.imageURL, car.imageURL)
    }

    func testGetCarResultForFailureCase() throws {
        mockDataService.getCarResult = .failure(.cantFetchCarData)

        XCTAssertNil(unit.alertItem)
        unit.fetchData()
        XCTAssertNotNil(unit.alertItem)
    }

    func testGetImageResultForSuccessCase() throws {
        let image = UIImage(systemName: "house.fill")!
        mockDataService.getImageResult = .success(image)

        unit.getImage(of: car)

        XCTAssertEqual(unit.image, image)
    }

    func testGetImageResultForFailureCase() throws {
        mockDataService.getImageResult = .failure(.cantFetchImage)

        XCTAssertNil(unit.alertItem)
        unit.getImage(of: car)
        XCTAssertNotNil(unit.alertItem)
    }

    func testGetMilesResultForSuccessCase() throws {
        let miles = 120

        mockDataService.getMilesResult = .success(miles)

        XCTAssertEqual(unit.milesTitle, "")
        unit.getMiles(of: car)
        XCTAssertEqual(unit.milesTitle, "\(miles)mi")
    }

    func testGetMilesResultForFailureCase() throws {
        mockDataService.getMilesResult = .failure(.cantFetchMiles)

        XCTAssertNil(unit.alertItem)
        unit.getMiles(of: car)
        XCTAssertNotNil(unit.alertItem)
    }

    func testLockDoorsForSuccessCase() throws {
        mockControlService.errorResult = nil

        unit.lockDoors { success in
            XCTAssertTrue(success)
        }
    }

    func testLockDoorsForFailureCase() throws {
        mockControlService.errorResult = .cantLockTheDoors
        XCTAssertNil(unit.alertItem)

        unit.lockDoors { success in
            XCTAssertFalse(success)
            XCTAssertNotNil(self.unit.alertItem)
        }
    }

    func testUnlockDoorsForSuccessCase() throws {
        mockControlService.errorResult = nil

        unit.unlockDoors { success in
            XCTAssertTrue(success)
        }
    }

    func testUnlockDoorsForFailureCase() throws {
        mockControlService.errorResult = .cantUnlockTheDoors
        XCTAssertNil(unit.alertItem)

        unit.unlockDoors { success in
            XCTAssertFalse(success)
            XCTAssertNotNil(self.unit.alertItem)
        }
    }

    func testCarModelTitle() throws {
        XCTAssertEqual(unit.carModelTitle, "")

        unit.fetchData()
        unit.updateCarModelTitle()

        XCTAssertEqual(unit.carModelTitle, "My \(unit.car.model)")
    }

}
