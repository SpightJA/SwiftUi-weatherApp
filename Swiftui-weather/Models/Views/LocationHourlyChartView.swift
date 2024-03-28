//
//  LocationHourlyChartView.swift
//  Swiftui-weather
//
//  Created by Jon Spight on 3/17/24.
//

import SwiftUI
import Charts

struct LocationHourlyChartView: View {
    var hourlyData : [hourData]
    
//    var hour = [hour(time: "10 am", HourValues: HourValues(temperature: 32.2))]
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill( .white )
                .ignoresSafeArea()
            
            VStack {
//                XaxisIcons(hourlyData: hourlyData, spacing: 9)
                Divider()
                    .frame(width: 360)
//                HourlyChartView(hourlyData: hourlyData)
            }
        }
        .frame(height: 200)
        .cornerRadius(22)
        .shadow(color: .cloudyBlue.opacity(0.5), radius: 2, x: 0.0, y: 0.0)
    }
    
}

#Preview {
    LocationHourlyChartView(hourlyData: mockData().hourlyData )
}



//struct HourlyChartView: View {
//    var hourlyData : [hourData]
//    let curGradient = LinearGradient(
//        gradient: Gradient (
//            colors: [
//                .cloudyBlue.opacity(0.4),
//                .cloudyBlue.opacity(0.0)
//            ]
//        ),
//        startPoint: .top,
//        endPoint: .bottom
//    )
//    
//    var body: some View {
//        Chart {
//            ForEach(hourlyData) { hour in
//                LineMark(
//                    x: PlottableValue.value("Time", hour.time),
//                    y: PlottableValue.value("Temp", hour.temp)
//                )
//                .interpolationMethod(.catmullRom)
//                .symbol(.circle)
//                .foregroundStyle(.cloudyBlue)
//                .shadow( radius: 3, x: 2.0, y: 2.0)
//                AreaMark( x: PlottableValue.value("Time", hour.time),
//                          y: PlottableValue.value("Temp", hour.temp)
//                )
//                .interpolationMethod(.cardinal)
//                .foregroundStyle(.clear)
//            }
//        }
//        .chartYAxis {
//            AxisMarks(position: .trailing) { _ in
//                AxisValueLabel()
//                    .font(Font.custom("PlusJakartaSans-Light", size: 10))
//            }
//        }
//        .chartXAxis {
//            AxisMarks(position: .top) { _ in
//                AxisGridLine().foregroundStyle(.clear)
//                AxisTick().foregroundStyle(.clear)
//                AxisValueLabel()
//                    .font(Font.custom("PlusJakartaSans-Light", size: 1))
//                    .foregroundStyle(.clear)
//            }
//        }
//        .padding()
//    }
//}

//struct XaxisIcons: View {
//    var hourlyData : [hourData]
//    var spacing : CGFloat
//    var body: some View {
//        HStack (alignment: .center, spacing:spacing) {
//            ForEach(hourlyData) { hour in
//                ChartXIcons(label: hour.time, temp: hour.temp)
//            }
//        }
//        .padding(.top,15)
//        .padding(.trailing,35)
//        .padding(.leading, 20)
//    }
//}
