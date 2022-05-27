//
//  ButtonWithLoader.swift
//  CarService
//
//  Created by Harutyun Shamyan on 24.05.22.
//

import SwiftUI

enum ButtonWithLoaderState {
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
    @Binding var state: ButtonWithLoaderState
    let action: () -> Void
    let label: () -> Label

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

struct ButtonWithLoader_Previews: PreviewProvider {
    static var previews: some View {
        ButtonWithLoader(state: .constant(.idle)) {
            print("start loading")
        } label: {
            Image("icn-unlock", bundle: nil)
        }
        .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
