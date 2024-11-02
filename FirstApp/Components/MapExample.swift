//
//  MapExample.swift
//  AppDemo
//
//  Created by Christian Vladimir Garzón Gallardo on 22/09/24.
//

import SwiftUI
import MapKit

struct MapExample: View {
    
    @State var position = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 19.292224, longitude: -99.038526), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    )
    )
    var body: some View {
        ZStack {
            MapReader{ proxy in
                	
                Map(position: $position){
//                    Marker("KFC", coordinate: CLLocationCoordinate2D(latitude: 19.292224, longitude: -99.038526))
                    Annotation("KFC", coordinate: CLLocationCoordinate2D(latitude: 19.292224, longitude: -99.038526)){
                        Circle().frame(height: 30)
                    }
                    .annotationTitles(.visible)
                }
                    .mapStyle(.standard(elevation: .realistic, showsTraffic: true))
                //                .onMapCameraChange { context in
                //                    print("Estamos en : \(context.region)")
                //                }
                    .onMapCameraChange(frequency: .continuous) { context in
                        print("Estamos en : \(context.region)")
                    }
                    .onTapGesture { coord in
                        if let coordinates = proxy.convert(coord, from: .local){
                            withAnimation{
                                position = MapCameraPosition.region(MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                                )
                                )
                            }
                        }
                    }
            }
            
            VStack{
                Spacer()
                HStack{
                    Button("Ir al sur"){
                        withAnimation{
                            position = MapCameraPosition.region(MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: 19.286473, longitude: -99.047310), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                            )
                            )
                        }
                    }
                    .padding(12)
                    .background(.white)
                    .cornerRadius(100)
                    .padding()
                    Button("Ir al norte"){
                        withAnimation{
                            position = MapCameraPosition.region(MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: 19.292224, longitude: -99.038526), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                            )
                            )
                        }
                    }
                    .padding(12)
                    .background(.white)
                    .cornerRadius(100)
                    .padding()
                }
            }
            
        }
    }
}

#Preview {
    MapExample()
}

