//
//  DoorsView.swift
//  CarService
//
//  Created by Harutyun Shamyan on 24.05.22.
//

import SwiftUI

struct DoorsView: View {

    @Binding var carModelName: String
    @StateObject var viewModel: ViewModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Doors")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.black)
                    .bold()
                Divider()
                    .frame(width: 1)
                Text(viewModel.statusText)
                    .font(.system(size: 13,
                                weight: .bold))
                    .foregroundColor(.gray)
            }
            .frame(height: 10)
            HStack(spacing: 10) {
                ButtonWithLoader(state: $viewModel.lockButtonState) {
                    viewModel.tryToLockDoors(carModelName)
                } label: {
                    Image("icn-lock", bundle: nil)
                }
                .padding(.vertical, 10)
                .padding(.leading, 10)
                ButtonWithLoader(state: $viewModel.unlockButtonState) {
                    viewModel.tryToUnlockDoors(carModelName)
                } label: {
                    Image("icn-unlock", bundle: nil)
                }
                .padding(.trailing, 10)
            }
            .background(Color.white)
            .cornerRadius(4)
        }

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

struct DoorsView_Previews: PreviewProvider {
    static var previews: some View {
        DoorsView(carModelName: .constant(""),
                     viewModel: DoorsView.ViewModel(lock: { completion in },
                                                  unlock: { completion in }))
            .previewInterfaceOrientation(.portrait)
    }
}
