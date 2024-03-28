//
//  WeatherDataView.swift
//  Swiftui-weather
//
//  Created by Jon Spight on 3/17/24.
//

import SwiftUI

struct WeatherDataHeaderView: View {
    var body: some View {
        HStack {
            VStack {
                Image(systemName: "drop")
                    .foregroundColor(.buttonAccent)
                Text("Humidity")
                    .font(Font.custom("PlusJakartaSans-Regular", size: 16))
                    .foregroundStyle(.titleAccent)

                Text("94%")
                    .font(Font.custom("PlusJakartaSans-Regular", size: 16))

            }
            Divider().frame(width: 50, height: 50)
            VStack {
                Image(systemName: "wind")
                    .foregroundColor(.buttonAccent)
                Text("Wind")
                    .font(Font.custom("PlusJakartaSans-Regular", size: 16))

                    .foregroundStyle(.titleAccent)

                Text("7km/h")
                    .font(Font.custom("PlusJakartaSans-Light", size: 16))

            }
            Divider().frame(width: 50, height: 50)
            VStack {
                Image(systemName: "cloud")
                    .foregroundColor(.buttonAccent)
                Text("Perception")
                    .font(Font.custom("PlusJakartaSans-Regular", size: 16))

                    .foregroundStyle(.titleAccent)
                Text("30%")
                    .font(Font.custom("PlusJakartaSans-Light", size: 16))

            }
        }
        .foregroundColor(.cloudyBlue)
        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WeatherDataHeaderView()
}

