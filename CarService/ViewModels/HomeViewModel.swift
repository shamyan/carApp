//
//  ViewModel.swift
//  CarService
//
//  Created by Harutyun Shamyan on 23.05.22.
//

import Foundation

final class HomeViewModel: ObservableObject {

    // MARK: Properties

    @Published var alertItem: LockAlertItem?
    @Published var car = CarFactory.shared.qx55
    @Published var lockStatusText: String = ""
    @Published var miles: Int = 120

    @Published var lockButtonState: LoadableButtonState = .idle
    @Published var unlockButtonState: LoadableButtonState = .idle

    func showLockAlertIfNeeded() {
        if lockButtonState == .loaded {
            return
        }
        let message = "Please confirm that you want to lock the doors of \(car.model)"
        alertItem = LockAlertItem(title: "Are you sure?",
                                message: message,
                       destructiveTitle: "Yes, Lock",
                                 action: .lock)
    }

    func showUnlockAlertIfNeeded() {
        if unlockButtonState == .loaded {
            return
        }
        let message = "Please confirm that you want to unlock the doors of \(car.model)"
        alertItem = LockAlertItem(title: "Are you sure?",
                                message: message,
                       destructiveTitle: "Yes, Unlock",
                                 action: .unlock)
    }

    func lockUnlockDoors(with action: LockAlertAction) {
        switch action {
        case .lock:
            lockDoors()
        case .unlock:
            unlockDoors()
        default:
            break
        }
    }

    func startEngine() {
        print("start engine...")
    }

    func stopEngine() {
        print("stop engine...")
    }

    // MARK: Private functions

    private func lockDoors() {
        print("lock doors...")
        lockStatusText = "..."
        lockButtonState = .loading
        unlockButtonState = .idle
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            print("doors locked")
            self.lockStatusText = "Locked"
            self.lockButtonState = .loaded
        }
    }

    private func unlockDoors() {
        print("unlock doors...")
        lockStatusText = "..."
        unlockButtonState = .loading
        lockButtonState = .idle
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            print("doors unlocked")
            self.lockStatusText = "Unlocked"
            self.unlockButtonState = .loaded
        }
    }
}
