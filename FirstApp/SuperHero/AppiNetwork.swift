//
//  AppiNetwork.swift
//  AppDemo
//
//  Created by Christian Vladimir Garzón Gallardo on 17/09/24.
//

import Foundation

class ApiNetwork{
    
    struct Wrapper:Codable{
        let response:String
        let results: [Superhero]
    }
    
    struct Superhero:Codable, Identifiable{
        let id:String
        let name:String
        let image:ImageSuperhero
    }
    
    struct ImageSuperhero:Codable{
        let url:String
    }
    
    struct SuperHeroCompleted:Codable{
        let id:String
        let name:String
        let image:ImageSuperhero
        let powerstats:Powerstats
        let biography:Biography
    }
    
    struct Powerstats:Codable{
        let  intelligence: String
        let  strength:String
        let  speed:String
        let  durability:String
        let  power:String
        let  combat:String
    }
    
    struct Biography:Codable{
        let alignment:String
        let publisher:String
        let aliases:[String]
        let fullName:String
        
        enum CodingKeys:String, CodingKey{
            case fullName = "full-name"
            case alignment = "alignment"
            case publisher = "publisher"
            case aliases = "aliases"
        }
    }
    
    func getHeroesByQuery(query:String) async throws -> Wrapper{
        let url = URL(string: "https://superheroapi.com/api/45126bc7999914720226d7f0c8a1671c/search/\(query)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        return wrapper
    }
    
    func getHeroById(id:String) async throws -> SuperHeroCompleted{
        let url = URL(string: "https://superheroapi.com/api/45126bc7999914720226d7f0c8a1671c/\(id)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(SuperHeroCompleted.self, from: data)
    }
}


    
