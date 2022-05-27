//
//  DoorsViewModelTests.swift
//  CarServiceTests
//
//  Created by Harutyun Shamyan on 24.05.22.
//

import XCTest
@testable import CarService

class DoorsViewModelTests: XCTestCase {

    private var unit: DoorsView.ViewModel!
    let car: Car = DataSet.qx55

    override func setUp() {
        unit = .init(lock: { completion in
            completion?(true)
        }, unlock: { completion in
            completion?(true)
        })
    }

    func testStatusText() throws {
        XCTAssertTrue(unit.statusText.isEmpty)
        XCTAssertEqual(unit.statusText, "")
    }

    func testLockButtonState() throws {
        XCTAssertEqual(unit.lockButtonState, .idle)
    }

    func testUnockButtonState() throws {
        XCTAssertEqual(unit.unlockButtonState, .idle)
    }

    func testLockAlertItem() throws {

        unit.tryToLockDoors(car.model)

        XCTAssertNotNil(unit.alertItem)
        XCTAssertEqual(unit.alertItem?.title, "Are you sure?")
        XCTAssertEqual(unit.alertItem?.message, "Please confirm that you want to lock the doors of \(car.model)")
        XCTAssertEqual(unit.alertItem?.destructiveTitle, "Yes, Lock")
    }

    func testUnlockAlertItem() throws {

        unit.tryToUnlockDoors(car.model)

        XCTAssertNotNil(unit.alertItem)
        XCTAssertEqual(unit.alertItem?.title, "Are you sure?")
        XCTAssertEqual(unit.alertItem?.message, "Please confirm that you want to unlock the doors of \(car.model)")
        XCTAssertEqual(unit.alertItem?.destructiveTitle, "Yes, Unlock")
    }

    func testLockDoorsApply() throws {

        unit.tryToLockDoors(car.model)
        unit.alertItem?.applyAction?()

        XCTAssertEqual(unit.statusText, "...")
        XCTAssertEqual(unit.lockButtonState, .loading)
        XCTAssertEqual(unit.unlockButtonState, .idle)
    }

    func testUnlockDoorsApply() throws {

        unit.tryToUnlockDoors(car.model)
        unit.alertItem?.applyAction?()

        XCTAssertEqual(unit.statusText, "...")
        XCTAssertEqual(unit.lockButtonState, .idle)
        XCTAssertEqual(unit.unlockButtonState, .loading)
    }

    func testLockUnlockTapAction() throws {

        XCTAssertEqual(unit.lockButtonState, .idle)
        XCTAssertEqual(unit.unlockButtonState, .idle)

        unit.tryToLockDoors(car.model)

        XCTAssertNotNil(unit.alertItem)
        unit.alertItem?.applyAction?()

        unit.alertItem = nil
        unit.tryToUnlockDoors(car.model)
        XCTAssertNil(unit.alertItem)

        XCTAssertEqual(unit.lockButtonState, .loading)
        XCTAssertEqual(unit.unlockButtonState, .idle)
    }

    func testUnlockLockTapAction() throws {

        XCTAssertEqual(unit.lockButtonState, .idle)
        XCTAssertEqual(unit.unlockButtonState, .idle)

        unit.tryToUnlockDoors(car.model)

        XCTAssertNotNil(unit.alertItem)
        unit.alertItem?.applyAction?()

        unit.alertItem = nil
        unit.tryToLockDoors(car.model)
        XCTAssertNil(unit.alertItem)

        XCTAssertEqual(unit.lockButtonState, .idle)
        XCTAssertEqual(unit.unlockButtonState, .loading)
    }
}
