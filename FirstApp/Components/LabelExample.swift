//
//  LabelExample.swift
//  AppDemo
//
//  Created by Christian Vladimir Garzón Gallardo on 15/09/24.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        Label("Toji Fushiguro", image: "Toji")
        Label("Icon", systemImage: "figure.walk")
        Label(
            title: { /*@START_MENU_TOKEN@*/Text("Label")/*@END_MENU_TOKEN@*/ },
            icon: { Image("Toji").resizable()
                .scaledToFit()
                .frame(height:30) }
        )
    }
}

#Preview {
    LabelExample()
}
