//
//  ChartXIcons.swift
//  Swiftui-weather
//
//  Created by Jon Spight on 3/17/24.
//

import SwiftUI
import Charts

struct ChartXIcons: View {
    
    var label : String
    var temp : Double
    var body: some View {
        VStack {
            Text(label)
                .font(Font.custom("PlusJakartaSans-Light", size: 12))
                .scaledToFit()
                .minimumScaleFactor(0.5)
            Image(systemName: "cloud.sun.rain.fill")
                .symbolRenderingMode(.multicolor)
                
            Text("\(Int(temp))°")
                .font(Font.custom("PlusJakartaSans-Light", size: 12))
                .scaledToFit()
                .minimumScaleFactor(0.5)
        }
        .foregroundStyle(.xaxis)
    }
}

#Preview {
    ChartXIcons(label:"10am", temp: 24)
}
