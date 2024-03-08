//
//  ContentView.swift
//  Swiftui-weather
//
//  Created by Jon Spight on 3/7/24.
//

//IDEA - build a model and refactor Hstack with an array
//IDEA - get real Weather api data
//IDEA - Build a tab bar that shows multiple cities

import SwiftUI

struct ContentView: View {
    @State private var isNight =   false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 76)
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "Tue",
                                   imageName: "cloud.sun.fill",
                                   temp: 74)
                    WeatherDayView(dayOfWeek: "Wed",
                                   imageName: "sun.max.fill",
                                   temp: 70)
                    WeatherDayView(dayOfWeek: "Thurs",
                                   imageName: "wind",
                                   temp: 66)
                    WeatherDayView(dayOfWeek: "Fri",
                                   imageName: "sun.and.horizon.fill",
                                   temp: 60)
                    WeatherDayView(dayOfWeek: "Sat",
                                   imageName: "moon.stars.fill",
                                   temp: 55)

                    
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                   backgroundColor: .white)
                }
                Spacer()
            }
            
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek   : String
    var imageName   : String
    var temp        : Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 24, weight: .regular, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temp)°")
                .font(.system(size: 30, weight: .regular, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var isNight     : Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .lightBlue]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
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
    var temp        : Int
    var body: some View {
        VStack (spacing: 8) {
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
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

