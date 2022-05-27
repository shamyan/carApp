//
//  DoorsView.swift
//  CarService
//
//  Created by Harutyun Shamyan on 24.05.22.
//

import SwiftUI

struct DoorsView: View {

    @EnvironmentObject private var viewModel: ViewModel

    private let car: Car

    init(car: Car) {
        self.car = car
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Doors")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.black)
                    .bold()
                Divider()
                    .frame(width: 5, height: 10)
                Text(viewModel.statusText)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.gray)
            }
            .frame(height: 10)

            HStack(spacing: 10) {
                LoadableButton(state: viewModel.lockButtonState) {
                    viewModel.tryToLockDoors(for: car)
                } label: {
                    Image("icn-lock", bundle: nil)
                }
                LoadableButton(state: viewModel.unlockButtonState) {
                    viewModel.tryToUnlockDoors(for: car)
                } label: {
                    Image("icn-unlock", bundle: nil)
                }
            }
            .frame(width: 150, height: 80)
            .background(Color.white)
            .cornerRadius(4)
        }

        .alert(item: $viewModel.alertItem, content: { item in
            Alert(title: Text(item.title),
                message: Text(item.message),
          primaryButton: .destructive(Text(item.destructiveTitle)) {
                viewModel.fireDoors(action: item.action)
            },
        secondaryButton: .cancel())
        })
    }
}

struct DoorsView_Previews: PreviewProvider {
    static var previews: some View {
        DoorsView(car: .qx55)
            .environmentObject(DoorsView.ViewModel())
    }
}
