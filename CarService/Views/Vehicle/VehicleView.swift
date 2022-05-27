//
//  VehicleView.swift
//  CarService
//
//  Created by Harutyun Shamyan on 25.05.22.
//

import SwiftUI

struct VehicleView: View {
    var body: some View {
        ZStack {
            Config.SwiftUI.Colors.background

            Text("Vehicle")
                .font(.system(size: 30,
                            weight: .bold,
                            design: .rounded))
        }
    }
}

struct VehicleView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleView()
    }
}
