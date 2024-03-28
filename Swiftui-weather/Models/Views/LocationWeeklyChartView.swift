//
//  LocationWeeklyView.swift
//  Swiftui-weather
//
//  Created by Jon Spight on 3/17/24.
//

import SwiftUI
import Charts

struct LocationWeeklyChartView: View {
    var weeklyData : [weekData]
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill( .white )
                .ignoresSafeArea()
            VStack {
                XAxisIcons(weeklyData: weeklyData)
                Divider()
                    .frame(width: 360)
                
                WeeklyChartView(weeklyData: weeklyData)
            }
        }
        .frame(height: 200)
        .cornerRadius(22)
        .shadow(color: .navyBlue1.opacity(0.5), radius: 2, x: 0.0, y: 0.0)
    }
}

#Preview {
    LocationWeeklyChartView(weeklyData: mockData().weeklyData)
}

struct XAxisIcons: View {
    var weeklyData : [weekData]
    
    var body: some View {
        HStack (alignment: .center, spacing:24){
            ForEach(weeklyData) { day in
                ChartXIcons(label: day.abv, temp: day.temp)
            }
        }
        .padding(.top,15)
        .padding(.trailing,15)
    }
}

struct WeeklyChartView: View {
    var weeklyData : [weekData]
    let curGradient = LinearGradient(
        gradient: Gradient (
            colors: [
                .cloudyBlue.opacity(0.4),
                .cloudyBlue.opacity(0.0)
            ]
        ),
        startPoint: .top,
        endPoint: .bottom
    )
    var body: some View {
        Chart {
            
            ForEach(weeklyData) { day in
                LineMark(
                    x: PlottableValue.value("interval", day.day),
                    y: PlottableValue.value("Temp", day.temp)
                )
                .interpolationMethod(.catmullRom)
                .symbol(.circle)
                .foregroundStyle(.cloudyBlue)
                .shadow( radius: 3, x: 2.0, y: 2.0)
                AreaMark( x: PlottableValue.value("interval", day.day),
                          y: PlottableValue.value("Temp", day.temp)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(curGradient)
            }
        }
        .chartYAxis {
            AxisMarks(position: .trailing) { _ in
                AxisValueLabel()
                    .font(Font.custom("PlusJakartaSans-Light", size: 10))
            }
        }
        .chartXAxis {
            AxisMarks(position: .top) { _ in
                AxisGridLine().foregroundStyle(.clear)
                AxisTick().foregroundStyle(.clear)
                AxisValueLabel()
                    .font(Font.custom("PlusJakartaSans-Light", size: 1))
                    .foregroundStyle(.clear)
            }
        }
        .padding()
    }
}
