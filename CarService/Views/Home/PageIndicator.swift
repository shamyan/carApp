//
//  PageIndicator.swift
//  CarService
//
//  Created by Harutyun Shamyan on 25.05.22.
//

import SwiftUI

struct PageIndicator: View {
    @Binding var selectedPage: Int
    let pageCount: Int

    var body: some View {
        HStack {
            ForEach(0..<pageCount, id: \.self) { page in
                PageIndicatorItem(selected: $selectedPage, page: page)
            }
        }
        .padding(.vertical, 10.0)
        .padding(.horizontal, 10.0)
    }
}

struct PageIndicator_Previews: PreviewProvider {
    static var previews: some View {
        PageIndicator(selectedPage: .constant(0), pageCount: 3)
    }
}
