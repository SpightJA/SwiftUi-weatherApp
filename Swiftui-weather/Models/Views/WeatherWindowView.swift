//
//  WeatherWindowView.swift
//  Swiftui-weather
//
//  Created by Jon Spight on 3/13/24.
//

import SwiftUI

struct WeatherWindowView: View {
    
    var location : City
    
    var body: some View {
        ZStack {
            
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.bg1, .darkendWhite1]), startPoint: .topLeading, endPoint: .bottomTrailing)
                
                HStack {
                    WeatherWindowDetailsView(location: location, startColor: .multiTemp, endColor: .multiTemp)
                        .scaledToFit()
                        .minimumScaleFactor(0.5)
                    Spacer()
                }
            }
            .frame(height:170)
            .cornerRadius(22)
        }
        .frame(width: .infinity, height: 160)   
    }
}

#Preview {
    WeatherWindowView(location: mockData().sampleLocation)
}
