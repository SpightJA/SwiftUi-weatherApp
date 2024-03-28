//
//  XaxisIcons.swift
//  Swiftui-weather
//
//  Created by Jon Spight on 3/18/24.
//

import SwiftUI

struct XaxisIcons: View {
    var hourlyData : [hourData]
    var spacing : CGFloat
    var body: some View {
        HStack (alignment: .center, spacing:spacing) {
            ForEach(hourlyData) { hour in
                ChartXIcons(label: hour.time, temp: hour.temp)
            }
        }
        .padding(.top,15)
        .padding(.trailing,35)
        .padding(.leading, 20)
    }
}

#Preview {
    XaxisIcons(hourlyData: mockData().hourlyData, spacing: 9)
}
