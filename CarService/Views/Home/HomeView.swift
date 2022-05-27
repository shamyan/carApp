//
//  HomeView.swift
//  CarService
//
//  Created by Harutyun Shamyan on 23.05.22.
//

import SwiftUI

struct HomeView: View {

    // MARK: Properties

    private var doorsViewModel: DoorsView.ViewModel!
    @StateObject private var viewModel: ViewModel
    @State private var selectedPage: Int = 0
    private let pageCount: Int = 3

    // MARK: Initializer

    init(viewModel: ViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
        doorsViewModel = .init(lock: viewModel.lockDoors,
                             unlock: viewModel.unlockDoors)
    }

    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ZStack {
                    Config.SwiftUI.Colors.background
                    ScrollView {
                        VStack {
                            HStack {
                                Image("icn-refresh", bundle: nil)
                                Text(viewModel.refreshStatusText)
                                    .foregroundColor(.black)
                            }
                            .padding()
                            TabView(selection: $selectedPage) {
                                ForEach(0..<pageCount, id: \.self) { index in
                                    PageView(image: $viewModel.image)
                                        .tag(index)
                                }
                            }
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                            .frame(height: max(geo.size.width, geo.size.height) * 0.25)
                            PageIndicator(selectedPage: $selectedPage,
                                             pageCount: pageCount)
                            HStack(spacing: 10) {
                                DoorsView(carModelName: $viewModel.carModelTitle,
                                             viewModel: doorsViewModel)

                                EngineView()
                            }
                            .padding(.top, 20)
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .background(Color.white)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text(viewModel.carModelTitle)
                                .foregroundColor(.black)
                                .font(.headline)
                            Divider()
                                .frame(width: 1, height: 20)
                                .background(Config.SwiftUI.Colors.main)
                            HStack {
                                Image("icn-gas", bundle: nil)
                                Text(viewModel.milesTitle)
                                    .bold()
                                    .foregroundColor(.black)
                            }
                        }
                        .frame(width: geo.size.width)
                    }
                }
            }
            .onAppear(perform: viewModel.fetchData)

            .alert(item: $viewModel.alertItem, content: { item in
                Alert(title: Text(item.title),
                    message: Text(item.message),
              primaryButton: .destructive(Text(item.destructiveTitle)) {
                    item.applyAction?()
                },
            secondaryButton: .cancel())
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
