//
//  IMCView.swift
//  AppDemo
//
//  Created by Christian Vladimir Garzón Gallardo on 15/09/24.
//

import SwiftUI

struct IMCView: View {
    
//    init(){
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
//    }
    
    @State var gender: Int = 0
    @State var age:Int = 18
    @State var weight:Int = 80
    @State var height:Double = 150
    
    var body: some View {
        VStack{
            HStack {
                ToggleButton(text: "Hombre", imageName: "sun.haze", gender: 0, selectedGender: $gender)
                
                ToggleButton(text: "Mujer", imageName: "sun.haze.fill", gender: 1,selectedGender: $gender)
            }
            HeightCalculator(selectedHeight: $height)
            HStack{
                CounterButton(title: "Edad", number: $age)
                CounterButton(title: "Peso", number: $weight)
            }
            IMCCalculateButton(userWeight: Double(weight), userHeight: height)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.backGroundApp)
        .toolbar{
            ToolbarItem(placement: .principal) {
                Text("Imc Calculator").bold().foregroundStyle(.white)
            }
        }
//        .navigationBarBackButtonHidden()
//        .navigationTitle("Imc Calculator")
    }
}

struct IMCCalculateButton:View {
    let userWeight:Double
    let userHeight:Double
    var body: some View {
        NavigationStack{
            NavigationLink(destination:{IMCResult(userWeight: userWeight, userHeight: userHeight)}){
                Text("Calcular")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.purple).frame(maxWidth: .infinity, maxHeight: 100)
                    .background(.backComponet)
            }
        }
    }
}

struct ToggleButton: View {
    let text:String
    let imageName:String
    let gender:Int
    @Binding var selectedGender: Int
        
    var body: some View {
        
        let color = if(gender == selectedGender){
            Color.backCompSelect
        }else{
            Color.backComponet
        }

        Button(action: {
            selectedGender = gender
        }) {
            VStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundStyle(.white)
                InformationText(text: text)
            }
            .frame(maxWidth: .infinity, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(color)
        }

    }
}

struct InformationText: View {
    let text:String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.white)
    }
}

struct TitleText: View {
    let text:String

    var body: some View {
        Text(text)
            .font(.title2)
            .foregroundStyle(.gray)
    }
}

struct HeightCalculator: View {
    @Binding var selectedHeight:Double
    
    var body: some View {
        VStack{
            TitleText(text: "Altura")
            InformationText(text: "\(Int(selectedHeight)) cm")
            Slider(value: $selectedHeight, in: 100...220, step: 1)
                .accentColor(.purple)
                .padding(.horizontal, 30)
        }
        .frame(maxWidth: .infinity, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(.backComponet)
    }
}

struct CounterButton: View {
    let title:String
    @Binding var number:Int
    var body: some View {
        VStack{
            TitleText(text: title)
            InformationText(text: String(number))
            HStack{
                Button(action:{
                    if(number > 0){
                        number -= 1
                    }
                }){
                    ZStack{
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.purple)
                        Image(systemName: "minus")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                    }
                }
                Button(action:{
                    if(number < 100){
                        number += 1
                    }
                }){
                    ZStack{
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.purple)
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(.backComponet)
    }
}



#Preview {
    IMCView()
    
//    toggleButton(text: "Chris", imageName: "sun.haze", index: 0)
}

