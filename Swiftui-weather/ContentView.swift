//
//  ContentView.swift
//  Swiftui-weather
//
//  Created by Jon Spight on 3/7/24.
//

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
                    ForEach(Days().days, id: \.self){ day in
                        WeatherDayView(dayOfWeek: day.title, imageName: day.imageName, temp: day.temp)
                        }
                    }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: isNight ? .black : .blue,
                                  backgroundColor: .yellow )
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

        ContainerRelativeShape()
            .fill( isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
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

