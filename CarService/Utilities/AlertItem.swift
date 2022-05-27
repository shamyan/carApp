//
//  LockAlertItem.swift
//  CarService
//
//  Created by Harutyun Shamyan on 23.05.22.
//

import Foundation

struct AlertItem: Identifiable {

    var id: String {
        get {
            return UUID().uuidString
        }
    }

    let title: String
    let message: String
    let destructiveTitle: String
    let applyAction: (() -> Void)?

    init(title: String, message: String, destructiveTitle: String, applyAction: (() -> Void)? = {}) {
        self.title = title
        self.message = message
        self.destructiveTitle = destructiveTitle
        self.applyAction = applyAction
    }
}
