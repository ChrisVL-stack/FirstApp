//
//  SwiftUIView.swift
//  FirstApp
//
//  Created by Christian Vladimir Garzón Gallardo on 14/09/24.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image("Toji")
            .resizable()
            .frame(width: 300, height: 200)
            .scaledToFit()
        
        Image(systemName: "figure.walk")
            .resizable()
    }
}

#Preview {
    ImageExample()
}
