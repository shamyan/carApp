//
//  LocationView.swift
//  CarService
//
//  Created by Harutyun Shamyan on 25.05.22.
//

import SwiftUI

struct LocationView: View {
    var body: some View {
        ZStack {
            Config.SwiftUI.Colors.background

            Text("Location")
                .font(.system(size: 30,
                            weight: .bold,
                            design: .rounded))
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
