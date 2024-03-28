//
//  LocationDetailDataview.swift
//  Swiftui-weather
//
//  Created by Jon Spight on 3/17/24.
//

import SwiftUI

struct LocationDetailDataview: View {
    let columns : [GridItem] = [GridItem(.flexible()),
                                GridItem(.flexible())]
    var body: some View {
        
        ScrollView {
            LazyVGrid( columns: columns, alignment: .leading, spacing: 20) {
                DetailView(image: "sun.min", title: "4 (Moderate)", sub: "UV Index")
                DetailView(image: "water.waves", title: "7 (Low health risk", sub: "Air quality")
                DetailView(image: "thermometer", title: "22", sub: "feels like")
                DetailView(image: "eye", title: "10 km", sub: "Visibility")
                DetailView(image: "wind", title: "SW 6 km/hr", sub: "Wind")
                DetailView(image: "smallcircle.circle", title: "7 hPa", sub: "pressure")
                
                
            }
        }
        .padding()
    }
}

#Preview {
    LocationDetailDataview()
}

struct DetailView: View {
    var image : String
    var title : String
    var sub : String
    var body: some View {
        HStack{
            Image(systemName: "\(image)")
                .resizable()
                .frame(width: 30, height: 30)
            VStack (alignment: .leading) {
                Text("\(title)")
                    .font(Font.custom("PlusJakartaSans-Bold", size: 14))
                    .scaledToFit()
                    .minimumScaleFactor(0.5)
                Text("\(sub)")
                    .font(Font.custom("PlusJakartaSans-Regular", size: 14))
                    .foregroundStyle(.gray1)
                    .scaledToFit()
                    .minimumScaleFactor(0.5)
            }
        }
        .symbolRenderingMode(.hierarchical)
        .foregroundStyle(.navyBlue1)
        
    }
}
