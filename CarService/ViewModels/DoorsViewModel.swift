//
//  DoorsViewModel.swift
//  CarService
//
//  Created by Harutyun Shamyan on 24.05.22.
//

import Foundation

extension DoorsView {
    final class ViewModel: ObservableObject {

        typealias LockDoorsHandler = (_ completion: ((Bool) -> Void)?) -> Void
        typealias UnlockDoorsHandler = (_ completion: ((Bool) -> Void)?) -> Void

        // MARK: Properties

        let lock: LockDoorsHandler
        let unlock: UnlockDoorsHandler

        @Published var lockButtonState: ButtonWithLoaderState = .idle
        @Published var unlockButtonState: ButtonWithLoaderState = .idle
        @Published var alertItem: AlertItem?
        @Published var statusText: String = ""

        init(lock: @escaping LockDoorsHandler, unlock: @escaping UnlockDoorsHandler) {
            self.lock = lock
            self.unlock = unlock
        }

        func tryToLockDoors(_ carModelName: String) {
            if lockButtonState == .loaded || unlockButtonState == .loading {
                return
            }
            alertItem = AlertItem(title: "Are you sure?",
                                message: "Please confirm that you want to lock the doors of \(carModelName)",
                       destructiveTitle: "Yes, Lock",
                            applyAction: { [weak self] in

                guard let self = self else { return }

                print("trying to lock the doors...")
                let prevStatus = self.statusText
                self.statusText = "..."
                self.lockButtonState = .loading
                self.lock({ success in
                    DispatchQueue.main.async {
                        if success {
                            print("doors locked")
                            self.statusText = "Locked"
                            self.lockButtonState = .loaded
                            self.unlockButtonState = .idle
                        } else {
                            print("can't lock the doors")
                            self.statusText = prevStatus
                            self.lockButtonState = .idle
                        }
                    }
                })
            })
        }

        func tryToUnlockDoors(_ carModelName: String) {
            if unlockButtonState == .loaded || lockButtonState == .loading {
                return
            }
            alertItem = AlertItem(title: "Are you sure?",
                                message: "Please confirm that you want to unlock the doors of \(carModelName)",
                       destructiveTitle: "Yes, Unlock",
                            applyAction: { [weak self] in

                guard let self = self else { return }

                print("trying to unlock the doors...")
                let prevStatus = self.statusText
                self.statusText = "..."
                self.unlockButtonState = .loading
                self.unlock({ success in
                    DispatchQueue.main.async {
                        if success {
                            print("doors unlocked")
                            self.statusText = "Unlocked"
                            self.unlockButtonState = .loaded
                            self.lockButtonState = .idle
                        } else {
                            print("can't unlock the doors")
                            self.statusText = prevStatus
                            self.unlockButtonState = .idle
                        }
                    }
                })
            })
        }

    }
}
