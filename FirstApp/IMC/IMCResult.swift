//
//  IMCResult.swift
//  AppDemo
//
//  Created by Christian Vladimir Garzón Gallardo on 16/09/24.
//

import SwiftUI

struct IMCResult: View {
    let userWeight:Double
    let userHeight:Double
    var body: some View {
        VStack{
            Text("Tu resultado")
                .font(.title)
                .bold()
                .foregroundStyle(.white)
            let result = calculateIMC(weight: userWeight, height: userHeight)
            InformationView(result: result)
        }
        .frame(maxWidth: .infinity, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(.backGroundApp)
    }
}

func calculateIMC(weight:Double, height:Double) -> Double{
    let result = weight/((height/100)*(height/100))
    return result
}

struct InformationView:View {
    let result:Double
    var body: some View {
        
        let information = getIMCResult(result: result)
        
        VStack{
            Text(information.0)
                .foregroundStyle(information.2)
                .font(.title)
                .bold()
            Text("\(result, specifier: "%.2f")")
                .font(.system(size: 80))
                .bold()
                .foregroundStyle(.white)
            Text(information.1)
                .foregroundStyle(.white)
                .font(.title2)
                .padding(.horizontal, 8)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(.backComponet)
        .cornerRadius(16)
        .padding(16)
    }
}

func getIMCResult(result:Double) -> (String, String, Color){
    let title:String
    let description:String
    let color:Color
    
    switch result{
    case 0.00..<20:
        title = "Peso bajo"
        description = "estas por debajo del peso recomendado segun el IMC"
        color = .yellow
    case 20.00..<25:
        title = "Peso normal"
        description = "Estas en el peso recomendado segun el IMC"
        color = .green
    case 25.00..<30:
        title = "Sobrepeso"
        description = "Estas por encima del peso recomendado segun el IMC"
        color = .orange
    case 30.00...100:
        title = "Obesidad"
        description = "Estas muy por encima del peso recomendado segun el IMC"
        color = .red
    default:
        title = "Error"
        description = "Ha ocurrido un error"
        color = Color.red
    }
    return(title, description, color)
}

#Preview {
    IMCResult(userWeight: 80, userHeight: 190)
}
