//
//  PageView.swift
//  CarService
//
//  Created by Harutyun Shamyan on 25.05.22.
//

import SwiftUI

struct PageView: View {
    @Binding var image: UIImage

    var body: some View {
        GeometryReader { geo in
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width * 0.8)
                .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(image: .constant(UIImage(named: DataSet.qx55.imageURL)!))
    }
}
