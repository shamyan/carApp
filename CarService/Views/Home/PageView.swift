//
//  PageItemView.swift
//  CarService
//
//  Created by Harutyun Shamyan on 25.05.22.
//

import SwiftUI

struct PageView: View {
    private let image: String

    init(image: String) {
        self.image = image
    }

    var body: some View {
        VStack {
            Image(image, bundle: nil)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
//                .padding()
        }
    }
}

struct PageItemView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(image: "qx55")
    }
}
