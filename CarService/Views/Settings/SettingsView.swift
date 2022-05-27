//
//  SettingsView.swift
//  CarService
//
//  Created by Harutyun Shamyan on 25.05.22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            Config.SwiftUI.Colors.background

            Text("Settings")
                .font(.system(size: 30,
                            weight: .bold,
                            design: .rounded))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
