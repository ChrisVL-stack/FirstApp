//
//  SuperHeroSearcher.swift
//  AppDemo
//
//  Created by Christian Vladimir Garzón Gallardo on 16/09/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperHeroSearcher: View {
    @State var superheroname:String = ""
    @State var wrapper:ApiNetwork.Wrapper? = nil
    @State var loading:Bool = false
    var body: some View {
        VStack{
            
            TextField("", text: $superheroname, prompt: Text("Superman...")
                .font(.title2)
                .bold()
                .foregroundStyle(.gray))
            .bold()
            .foregroundStyle(.white)
            .font(.title2)
            .padding(16)
            .border(.purple, width: 1.5)
            .padding(.horizontal, 15)
            .autocorrectionDisabled()
            .onSubmit {
                loading = true
                print(superheroname)
                Task{
                    do{
                        wrapper = try await ApiNetwork().getHeroesByQuery(query: superheroname)
                    }catch{
                        print("Error!!")
                    }
                    loading = false
                }
            }
            
            if loading{
                ProgressView().tint(.white)
            }
            
            NavigationStack{
                List(wrapper?.results ?? []){ superhero in
                    ZStack {
                        SuperheroItem(superhero: superhero)
                        NavigationLink(destination: SuperheroDetail(id: superhero.id)){EmptyView()}.opacity(0)
                    }
                    .listRowBackground(Color.backGroundApp)
                }
                .listStyle(.plain)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(.backGroundApp)
    }
}

struct SuperheroItem:View {
    let superhero:ApiNetwork.Superhero
    var body: some View {
        ZStack{
            WebImage(url: URL(string: superhero.image.url))
                .resizable()
                .indicator(.activity )
                .scaledToFill()
                .frame(height: 200)
            
            VStack{
                Spacer()
                Text(superhero.name)
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.5))
            }
        }
        .frame(height: 200)
        .cornerRadius(32)
    }
}

#Preview {
    SuperHeroSearcher()
}
