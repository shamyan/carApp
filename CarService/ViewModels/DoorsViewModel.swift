//
//  DoorsViewModel.swift
//  CarService
//
//  Created by Harutyun Shamyan on 24.05.22.
//

import Foundation

final class DoorsViewModel: ObservableObject {

    // MARK: Properties

    @Published var lockButtonState: LoadableButtonState = .idle
    @Published var unlockButtonState: LoadableButtonState = .idle
    @Published var alertItem: LockAlertItem?
    @Published var statusText: String = ""

    // MARK: Public functions

    func tryToLockDoors(_ car: Car) {
        if lockButtonState == .loaded {
            return
        }
        let message = "Please confirm that you want to lock the doors of \(car.model)"
        alertItem = LockAlertItem(title: "Are you sure?",
                                message: message,
                       destructiveTitle: "Yes, Lock",
                                 action: .lock)
    }

    func tryToUnlockDoors(_ car: Car) {
        if unlockButtonState == .loaded {
            return
        }
        let message = "Please confirm that you want to unlock the doors of \(car.model)"
        alertItem = LockAlertItem(title: "Are you sure?",
                                message: message,
                       destructiveTitle: "Yes, Unlock",
                                 action: .unlock)
    }

    func lock(with action: LockAlertAction) {
        switch action {
        case .lock:
            lockDoors()
        case .unlock:
            unlockDoors()
        default:
            break
        }
    }

    // MARK: Private functions

    private func lockDoors() {
        print("lock doors...")
        statusText = "..."
        lockButtonState = .loading
        unlockButtonState = .idle
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            print("doors locked")
            self.statusText = "Locked"
            self.lockButtonState = .loaded
        }
    }

    private func unlockDoors() {
        print("unlock doors...")
        statusText = "..."
        unlockButtonState = .loading
        lockButtonState = .idle
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            print("doors unlocked")
            self.statusText = "Unlocked"
            self.unlockButtonState = .loaded
        }
    }
}
