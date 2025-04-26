//
//  ContentView.swift
//  WeatherDemo
//
//  Created by Bruno Henrique Ferraz da Silva on 17/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
              if let weather = weather {
                  WeatherView(weather: weather)
                  
              }else{
                  LoadingView()
                      .task {
                          do{
                              weather = try await weatherManager.getCurrentLocation(latitude: location.latitude, longitude: location.longitude)
                          }catch {
                              print("Erro ao carregar o clima: \(error)")
                          }
                      }
              }
              
            }else{
                if locationManager.isLoading {
                    LoadingView()
                }else{
                        WelcomeView()
                            .environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.653, saturation: 0.676, brightness: 0.278))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
