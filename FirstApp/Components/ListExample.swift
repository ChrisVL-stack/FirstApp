//
//  ListExample.swift
//  AppDemo
//
//  Created by Christian Vladimir Garzón Gallardo on 16/09/24.
//

import SwiftUI

var pokemons = [
    Pokemon(name: "Picachu"),
    Pokemon(name: "Charmander"),
    Pokemon(name: "Charmillion"),
    Pokemon(name: "Charizar"),
    Pokemon(name: "Chrisssi")
]

var digimons = [
    Digimon(name: "Agumon"),
    Digimon(name: "Graymon"),
    Digimon(name: "Chrismon"),
    Digimon(name: "Chrismon"),
    Digimon(name: "Supermon"),
]

struct ListExample: View {
    var body: some View {
        List{
            Section(header: Text("Pokemons")) {
                ForEach(pokemons, id:\.name) { pokemon in
                    /*@START_MENU_TOKEN@*/Text(pokemon.name)/*@END_MENU_TOKEN@*/
                }
            }
            Section(header: Text("Digimons")) {
                ForEach(digimons){digimon in
                    Text(digimon.name)
                }
            }
        }
        .listStyle(.automatic)
    }
}


struct Pokemon{
    let name:String
}

struct Digimon: Identifiable{
    var id = UUID()
    let name:String
}


#Preview {
    ListExample()
}

