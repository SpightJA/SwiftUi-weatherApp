//
//  MainTempView.swift
//  Swiftui-weather
//
//  Created by Jon Spight on 3/18/24.
//

import SwiftUI

struct MainTempView: View {
    var temp : String
    var startColor : Color
    var endColor : Color
    var body: some View {
        Text("\(temp)°")
            .font(Font.custom("PlusJakartaSans-Bold", size: 88))
            .bold()
            .foregroundStyle(
                LinearGradient(gradient: Gradient(colors: [startColor.opacity(0.4), endColor]), startPoint: .bottomLeading, endPoint: .top))
    }
}
#Preview {
    MainTempView(temp: "26", startColor: .yellow1, endColor: .navyBlue1)
}
