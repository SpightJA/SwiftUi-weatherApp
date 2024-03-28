//
//  LocationDataView.swift
//  Swiftui-weather
//
//  Created by Jon Spight on 3/17/24.
//

import SwiftUI

struct LocationDataView: View {
//    var location : City
    var name : String
    var hourlyData : Forecast.TimeLines.Hour
    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill( .darkendWhite1.opacity(0.5))
                .ignoresSafeArea()
            VStack {
                
                WeatherDataHeaderView()
                ScrollView (.horizontal){
                    HStack {
//                        LocationHourlyChartView(hourlyData: mockData().hourlyData)
//                            .containerRelativeFrame(.horizontal, count: 1, spacing:15)
//                            .scrollTransition { content, phase in
//                                content
//                                    .opacity(phase.isIdentity ? 1.0 : 0.5)
//                                    .scaleEffect(x : phase.isIdentity ? 1.0 : 0.8,
//                                                 y: phase.isIdentity ? 1.0 : 0.8)
//                            }
//                        
//                        LocationWeeklyChartView(weeklyData: mockData().weeklyData)
//                            .containerRelativeFrame(.horizontal, count: 1, spacing: 15)
//                            .scrollTransition { content, phase in
//                                content
//                                    .opacity(phase.isIdentity ? 1.0 : 0.5)
//                                    .scaleEffect(x : phase.isIdentity ? 1.0 : 0.8,
//                                                 y: phase.isIdentity ? 1.0 : 0.8)
//
//                            }
                    }
                    .scrollTargetLayout()
                    
                    .frame(height: 220)
                }
                .contentMargins(.horizontal, 2, for: .scrollContent)
                .scrollTargetBehavior(.viewAligned)
                LocationDetailDataview()
                Text("Weather for \(name)")
                    .font(Font.custom("PlusJakartaSans-Regular", size: 16))
                    .foregroundStyle(.navyBlue1)
            }
        }
        .frame(height: .infinity)
    }
}

//#Preview {
//    LocationDataView(location: mockData().sampleLocation,
//                     forecast:Forecast.init(timelines: Forecast.TimeLines(minutely: [], hourly: , daily: []), location: Forecast.Location(lat: 12.0, lon: 12.1, name: "Chicago")) )
//}
