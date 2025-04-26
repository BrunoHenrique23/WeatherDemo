//
//  WeatherView.swift
//  WeatherDemo
//
//  Created by Bruno Henrique Ferraz da Silva on 17/03/25.
//

import SwiftUI

struct WeatherView: View {
    
    var weather: ResponseBody
    @State private var city: Bool = false
    
    var body: some View {
            ZStack(alignment: .leading) {
                VStack{
                    VStack (alignment: .leading, spacing: 5){
                        HStack{
                            Text(weather.name)
                                .bold()
                                .font(.title)
                            Spacer()
                            
                            Button {
                                city = true
                            } label: {
                                Image(systemName: "location.circle.fill")
                            }
                            
                        }
                        HStack {
                            Text("Hoje, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                                .fontWeight(.light)
                            
                            Spacer()
                        }
                        Spacer()
                        
                        VStack{
                            HStack{
                                VStack(spacing: 20){
                                    Image(systemName: "sun.max")
                                        .font(.system(size: 40))
                                    Text(weather.weather[0].main)
                                }
                                .frame(width: 150, alignment: .leading)
                                Spacer()
                                Text(weather.main.feelsLike.roundDouble() + "°")
                                    .font(.system(size: 100))
                                    .fontWeight(.bold)
                                    .padding()
                            }
                            
                            Spacer()
                                .frame(height: 80)
                            
                            AsyncImage(url: URL(string: "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")){image in
                                image.resizable().aspectRatio(contentMode: .fit)
                                    .frame(width: 350)
                                    .cornerRadius(30)
                                
                            } placeholder: {
                                ProgressView()
                            }
                            Spacer()
                            
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack{
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 20){
                        Text("Tempo agora")
                            .bold().padding(.bottom)
                        HStack{
                            WeatherRow(logo: "thermometer", name: "Temp Min:", value: (weather.main.tempMin.roundDouble() + "°"))
                            
                            Spacer()
                            
                            WeatherRow(logo: "thermometer", name: "Temp Máx:", value: (weather.main.tempMax.roundDouble() + "°"))
                        }
                        HStack{
                            WeatherRow(logo: "wind", name: "Velocidade do vento:", value: (weather.wind.speed.roundDouble() + "m/s"))
                            Spacer()
                            
                            WeatherRow(logo: "humidity", name: "Humidade:", value: (weather.main.humidity.roundDouble() + "%"))
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.bottom, 20)
                    .foregroundColor(Color(hue: 0.653, saturation: 0.676, brightness: 0.278))
                    .background(.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                }
            }
            
            .edgesIgnoringSafeArea(.bottom)
            .background(Color(hue: 0.653, saturation: 0.676, brightness: 0.278))
            .preferredColorScheme(.dark)
        
       
            }
            
        }
    
        

#Preview {
    WeatherView(weather: previewWeatherData)
}
