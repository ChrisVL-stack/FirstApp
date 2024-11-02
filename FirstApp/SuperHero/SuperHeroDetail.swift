//
//  SuperHeroDetail.swift
//  AppDemo
//
//  Created by Christian Vladimir Garzón Gallardo on 18/09/24.
//

import SwiftUI
import SDWebImageSwiftUI
import Charts

struct SuperheroDetail: View {
    let id:String
    
    @State var superhero:ApiNetwork.SuperHeroCompleted? = nil
    @State var loading:Bool = true
    
    var body: some View {
        VStack{
            if loading{
                ProgressView().tint(.white)
            }else if let superhero = superhero{
                WebImage(url: URL(string: superhero.image.url))
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    .cornerRadius(20)
                    .padding(15)
                    .clipped()
                Text(superhero.name)
                    .bold()
                    .font(.title2)
                    .foregroundStyle(.white)
                ForEach(superhero.biography.aliases, id: \.self){ alias in
                    Text(alias)
                        .foregroundStyle(.gray)
                        .italic()
                }
                SuperheroStats(stats: superhero.powerstats)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(.backGroundApp)
        .onAppear {
            Task {
                do {
                    superhero = try await ApiNetwork().getHeroById(id: id)
                } catch {
                    superhero = nil
                }
                loading = false
            }
        }
    }
}

struct SuperheroStats: View {
    let stats:ApiNetwork.Powerstats
    var body: some View {
        VStack{
            
            Chart{
                SectorMark(angle: .value("Count", Int(stats.combat) ?? 0), innerRadius: .ratio(0.6), angularInset: 1
                )
                .cornerRadius(5)
                .foregroundStyle(by: .value("Category", "Combat"))
                SectorMark(angle: .value("Count", Int(stats.durability) ?? 0), innerRadius: .ratio(0.6), angularInset: 1
                )
                .cornerRadius(5)
                .foregroundStyle(by: .value("Category", "Durability"))
                SectorMark(angle: .value("Count", Int(stats.intelligence) ?? 0), innerRadius: .ratio(0.6), angularInset: 1
                )
                .cornerRadius(5)
                .foregroundStyle(by: .value("Category", "Intelligence"))
                SectorMark(angle: .value("Count", Int(stats.power) ?? 0), innerRadius: .ratio(0.6), angularInset: 1
                )
                .cornerRadius(5)
                .foregroundStyle(by: .value("Category", "Speed"))
                SectorMark(angle: .value("Count", Int(stats.speed) ?? 0), innerRadius: .ratio(0.6), angularInset: 1
                )
                .cornerRadius(5)
                .foregroundStyle(by: .value("Category", "Stringth"))
                SectorMark(angle: .value("Count", Int(stats.strength) ?? 0), innerRadius: .ratio(0.6), angularInset: 1
                )
                .cornerRadius(5)
                .foregroundStyle(by: .value("Category", "Power"))

            }
            .padding(40)
            
        }
        .frame(maxWidth: .infinity, maxHeight: 250)
        .background(.white)
        .cornerRadius(20)
        .padding(25)
    }
}

#Preview {
    SuperheroDetail(id: "1")
}

