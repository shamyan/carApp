//
//  PageIndicator.swift
//  CarService
//
//  Created by Harutyun Shamyan on 25.05.22.
//

import SwiftUI

struct PageIndicatorItem: View {
    @Binding var selected: Int
    let page: Int

    var body: some View {
        ZStack {
            Rectangle()
                .fill(page == selected ? Config.SwiftUI.Colors.main : Color.black)
                .frame(width: 40, height: 2)
                .padding(.horizontal, 20)
        }
        .frame(width: 40, height: 30)
        .onTapGesture {
            withAnimation(.spring()) {
                selected = page
            }
        }
    }
}

struct PageIndicator_Previews: PreviewProvider {
    static var previews: some View {
        PageIndicatorItem(selected: .constant(0), page: 0)
    }
}
