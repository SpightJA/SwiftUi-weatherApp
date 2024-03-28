////
////  WeatherWindowView.swift
////  Swiftui-weather
////
////  Created by Jon Spight on 3/12/24.
////
//
//import SwiftUI
//
//struct CurrentWeatherWindowView: View {
//    var location : City
//    var body: some View {
//        ZStack {
//            LinearGradient(gradient: Gradient(colors: [.bg1, .darkendWhite1]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            
//            
//            WeatherWindowDetailsView(location: location , startColor: .dayNight, endColor: .navyBlue1)
//            
//            Image(systemName: "circle.fill")
//                .resizable()
//                .frame(width: 80, height: 80)
//                .aspectRatio(contentMode: .fit)
//                .offset(CGSize(width: 75.0, height: -25.0))
//                .foregroundStyle(
//                    .linearGradient(colors: [.yellow1, .orange1], startPoint: .top, endPoint: .bottom)
//                )
//                .shadow(color: .yellow1, radius: 10, x: 0.0, y: 3.0)
//            Image(systemName: "cloud.fill")
//                .resizable()
//                .frame(width: 160, height: 120)
//                .aspectRatio(contentMode: .fit)
//                .offset(CGSize(width: 65.0, height: 35.0))
//                .foregroundStyle(.darkendWhite1)
//                .opacity(0.5)
//                .shadow( radius: 5, x: 2.0, y: 7.0)
//            Image(systemName: "cloud.fill")
//                .resizable()
//                .frame(width: 100, height: 90)
//                .aspectRatio(contentMode: .fit)
//                .offset(CGSize(width: 125.0, height: 0.0))
//                .foregroundStyle(.darkendWhite1)
//                .opacity(0.6)
//                .shadow( radius: 5, x: 2.0, y: 2.0)
//        }
//        .frame(width: .infinity,  height: 250)
//        .cornerRadius(22)
//        .shadow(color: .navyBlue1.opacity(0.5), radius: 7, x: 2.0, y: 2.0)
//    }
//}
//
//#Preview {
//    CurrentWeatherWindowView(location: mockData().sampleLocation)
//}
