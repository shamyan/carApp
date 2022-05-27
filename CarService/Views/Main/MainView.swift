//
//  MainView.swift
//  CarService
//
//  Created by Harutyun Shamyan on 24.05.22.
//

import SwiftUI

struct MainView: View {

    private let homeViewModel = HomeView.ViewModel()

    var body: some View {
        TabView {
            HomeView(viewModel: homeViewModel)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            VehicleView()
                .tabItem {
                    Image(systemName: "car.fill")
                    Text("Vehicle")
                }
            LocationView()
                .tabItem {
                    Image(systemName: "location.circle.fill")
                    Text("Location")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
        .accentColor(Config.SwiftUI.Colors.main)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
