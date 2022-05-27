//
//  EngineView.swift
//  CarService
//
//  Created by Harutyun Shamyan on 24.05.22.
//

import SwiftUI

struct EngineView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Engine")
                .bold()
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.black)
                .frame(height: 10)
            HStack {
                ButtonWithLoader(state: .constant(.idle)) {
                    print("start engine")
                } label: {
                    Text("START")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.white)
                }
                .padding(.vertical, 10)
                .padding(.leading, 10)
                ButtonWithLoader(state: .constant(.idle)) {
                    print("stop engine")
                } label: {
                    Text("STOP")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.white)
                }
                .padding(.trailing, 10)
            }
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
