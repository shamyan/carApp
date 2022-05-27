//
//  HomeView.swift
//  CarService
//
//  Created by Harutyun Shamyan on 23.05.22.
//

import SwiftUI

struct PageIndicator: View {

    @Binding var selected: Int

    var body: some View {
        Rectangle()
            .fill(Color.blue)
            .frame(width: 100, height: 3)
            .onTapGesture {
                selected = 1
            }
    }
}

struct HomeView: View {
    @StateObject private var viewModel: ViewModel

    init(viewModel: ViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            ZStack {
                Config.SwiftUI.Colors.background

                VStack {
                    PageItemView(image: "qx55")



                    HStack(spacing: 20) {
                        DoorsView(car: .qx55)
                            .environmentObject(DoorsView.ViewModel())
                        EngineView()
                    }
                    Spacer()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.white)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("My \(viewModel.car.model)")
                            .frame(width: 100)
                            .foregroundColor(.black)
                            .font(.headline)
                        Divider()
                            .frame(width: 2, height: 20)
                            .background(Config.SwiftUI.Colors.main)
                        Image("icn-gas", bundle: nil)
                        Text("\(viewModel.car.miles)mi")
                            .bold()
                            .frame(width: 50)
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .onAppear(perform: viewModel.getCar)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
