//
//  ContentView.swift
//  FirstApp
//
//  Created by Christian Vladimir Garzón Gallardo on 12/09/24.
//

import SwiftUI

struct Exercise1: View {
    var body: some View {
        VStack {
            HStack{
                Rectangle()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Rectangle()
                    .foregroundColor(.orange)
                Rectangle()
                    .foregroundColor(.yellow)
            }.frame(height: 100)
            Rectangle()
                .foregroundColor(.orange)
                .frame(height: 100)
            HStack{
                Circle()
                    .foregroundColor(.green)
                Rectangle()
                    .frame(height: 300)
                Circle()
                    .foregroundColor(.indigo)
            }
            Rectangle()
                .foregroundColor(.orange)
                .frame(height: 100)
            HStack{
                Rectangle()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Rectangle()
                    .foregroundColor(.orange)
                Rectangle()
                    .foregroundColor(.yellow)
            }.frame(height: 100)
        }
        .background(.red)
    }
}

#Preview {
    Exercise1()
}
