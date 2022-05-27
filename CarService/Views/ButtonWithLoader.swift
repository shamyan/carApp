//
//  LoadableButton.swift
//  CarService
//
//  Created by Harutyun Shamyan on 24.05.22.
//

import SwiftUI

enum LoadableButtonState {
    case idle
    case loading
    case loaded

    var color: Color {
        switch self {
        case .idle:
            return .black
        default:
            return Config.SwiftUI.Colors.main
        }
    }
}

struct ButtonWithLoader<Label> : View where Label : View {
    private var state: LoadableButtonState
    private let label: () -> Label
    private let action: () -> Void

    init(state: LoadableButtonState, action: @escaping () -> Void, label: @escaping () -> Label) {
        self.state = state
        self.action = action
        self.label = label
    }

    var body: some View {
        if state == .loading {
            CircularLoader(color: state.color)
                .frame(width: 60, height: 60)
        } else {
            Button {
                action()
            } label: {
                label()
            }
            .frame(width: 60, height: 60)
            .background(state.color)
            .cornerRadius(30)
        }
    }
}

struct LoadableImageButton_Previews: PreviewProvider {
    static var previews: some View {
        ButtonWithLoader(state: .idle) {
            print("start loading")
        } label: {
            Image("icn-unlock", bundle: nil)
        }
    }
}
