//
//  Place.swift
//  AppDemo
//
//  Created by Christian Vladimir Garzón Gallardo on 23/09/24.
//

import Foundation
import MapKit

struct Place:Identifiable, Codable{
    var id = UUID()
    var name:String
    var coordinates:CLLocationCoordinate2D
    var favo:Bool
    
    enum CodingKeys: CodingKey{
        case id, name, favo, latitude, longitude
    }
    
    init(id: UUID = UUID(), name: String, coordinates: CLLocationCoordinate2D, favo: Bool) {
        self.id = id
        self.name = name
        self.coordinates = coordinates
        self.favo = favo
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let latitude = try container.decode(CLLocationDegrees.self, forKey: .latitude)
        let longitude = try container.decode(CLLocationDegrees.self, forKey: .longitude)
        
        coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        name = try container.decode(String.self, forKey: .name)
        favo = try container.decode(Bool.self, forKey: .favo)
        id = try container.decode(UUID.self, forKey: .id)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(coordinates.latitude, forKey: .latitude)
        try container.encode(coordinates.longitude, forKey: .longitude)
        try container.encode(name, forKey: .name)
        try container.encode(favo, forKey: .favo)
        try container.encode(id, forKey: .id)
    }
    
}

