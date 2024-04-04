//
//  ContentView.swift
//  Swiftui-weather
//
//  Created by Jon Spight on 3/7/24.
//

import SwiftUI
import Foundation


struct WeatherHomeView: View {
    @State private var isNight =   false
    @ObservedObject var weatherKitManager =  WeatherKitManager()
    @StateObject var locationManager = LocationManager()
    var body: some View {
        if locationManager.authorizationStatus != .authorizedWhenInUse { //change for testing
            ZStack {
                LinearGradient(gradient: Gradient(colors: [ .blue, .lightBlue]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
                
                VStack {
                    CityTextView(cityName: "Cupertino, CA")
                    MainWeatherStatusView(imageName: isNight ? weatherKitManager.symbol : "cloud.sun.fill", temp: weatherKitManager.temp)
                    
                    WeatherUpdateView(name: "Cupertino", date: weatherKitManager.date, min: weatherKitManager.dailyLowTemp, max: weatherKitManager.dailyHighTemp, descrip: weatherKitManager.descrip)
                }
            }
            .task {
                await weatherKitManager.getWeather(latitude: locationManager.latitude, longitude: locationManager.longitude)
            }
        }
        else {
            Text("Sorry no sky view for you")
        }
        //            .sheet(isPresented: $isNight) {
        //
        //
        //            }
        
        
        
    }
}

#Preview {
    WeatherHomeView()
}

struct CityTextView: View {
    var cityName : String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName   : String
    var temp        : String
    
    var body: some View {
        VStack (spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
            
        }
        .padding(.bottom, 40 )
    }
}

struct WeatherUpdateView: View {
    var name : String
    var date : String
    var min         : String
    var max         : String
    var descrip     : String
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 2) {
                //font will need to be PLus jarkarta Sans - light , regular, bold
                Text("\("name")")
                    .font(.system(size: 40))
                    .bold()
                //                    .foregroundStyle(.titleAccent)
                Text(" Updated Now")
                    .font(.system(size: 12))
                    .foregroundStyle(.gray)
                    .padding(.top, -10)
                    .padding(.bottom, 10)
                
                Text("\(min) - \(max)")
                    .font(.system(size: 40))
                    .bold()
                //                    .foregroundStyle(.buttonAccent)
                Text(descrip)
                    .font(.system(size: 12))
                //                    .foregroundStyle(.titleAccent)
                    .padding(.top, -10)
                    .padding(.bottom, 20)
                Text(" \(date)")
                //                    .foregroundStyle(.titleAccent)
                
            }
            .padding(.leading, 40)
            Spacer()
        }
    }
    
}
