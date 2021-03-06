//
//  CircularLoader.swift
//  CarService
//
//  Created by Harutyun Shamyan on 23.05.22.
//

import SwiftUI

struct CircularLoader: View {
    @State private var isLoading = false
    private let color: Color

    init(color: Color) {
        self.color = color
    }

    var body: some View {
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(color, lineWidth: 2)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(Animation.default.repeatForever(autoreverses: false), value: UUID())
            .onAppear {
                self.isLoading = true
            }
    }
}

struct CircularLoader_Previews: PreviewProvider {
    static var previews: some View {
        CircularLoader(color: Config.SwiftUI.Colors.main)
    }
}
