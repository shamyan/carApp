//
//  EngineView.swift
//  CarService
//
//  Created by Harutyun Shamyan on 24.05.22.
//

import SwiftUI

struct EngineView: View {
    @StateObject private var viewModel: ViewModel

    init(viewModel: ViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Engine")
                .bold()
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.black)
                .frame(height: 10)

            HStack(spacing: 10) {
                LoadableButton(state: .idle) {
                    viewModel.startEngine()
                } label: {
                    Text("START")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.white)
                }
                LoadableButton(state: .idle) {
                    viewModel.stopEngine()
                } label: {
                    Text("STOP")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.white)
                }
            }
            .frame(width: 150, height: 80)
            .background(Color.white)
            .cornerRadius(4)
        }
    }
}

struct EngineView_Previews: PreviewProvider {
    static var previews: some View {
        EngineView()
    }
}
