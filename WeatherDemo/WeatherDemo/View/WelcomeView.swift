//
//  WelcomeView.swift
//  WeatherDemo
//
//  Created by Bruno Henrique Ferraz da Silva on 17/03/25.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {

        VStack{
            VStack(spacing: 20){
                Text("Bem vindo(a) ao Weather App!")
                    .bold().font(.title)
                Text("Por favor compartilhe a sua localização para poder mostrar o clima local!")
                    .padding()
            }
            
            
            
            .multilineTextAlignment(.center)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        LocationButton(.shareCurrentLocation){
            locationManager.requestLocation()
        }
        
        
        
        .cornerRadius(30)
        .symbolVariant(.fill)
        .foregroundColor(.white)
        
    }
}

#Preview {
    WelcomeView()
}
