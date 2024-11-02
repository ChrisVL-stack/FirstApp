//
//  ButtonExample.swift
//  AppDemo
//
//  Created by Christian Vladimir Garzón Gallardo on 15/09/24.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Button("Hola") {
            print("holissss")
        }
        Button(action: {print("holaaa")}, label: {
            Text("Hola")
                .frame(width: 100, height: 50)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(100)
        })
    }
}

struct Counter: View {
    @State var subscribersNumber = 0
    var body: some View {
        Button(action: {
            subscribersNumber += 1
            }, label: {
            Text("Supreme: \(subscribersNumber)")
                .bold()
                .font(.title)
                .frame(height: 50)
                .foregroundColor(.white)
                .background(.red)
                .cornerRadius(13)
        })
    }
}

#Preview {
    Counter()
}
