//
//  MenueView.swift
//  AppDemo
//
//  Created by Christian Vladimir Garzón Gallardo on 15/09/24.
//

import SwiftUI

struct MenueView: View {
    var body: some View {
        NavigationStack{
            List{
                NavigationLink(destination: IMCView()){
                    Text("IMC Calculator")
                }
                NavigationLink(destination: SuperHeroSearcher()){
                    Text("Super hero finder")
                }
                NavigationLink(destination: FavPlaces()){
                    Text("Favorite Places")
                }
            }
        }
    }
}

#Preview {
    MenueView()
}
