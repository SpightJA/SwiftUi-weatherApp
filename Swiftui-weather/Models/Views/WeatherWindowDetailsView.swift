////
////  WeatherWindowDetailsView.swift
////  Swiftui-weather
////
////  Created by Jon Spight on 3/18/24.
////
//
//import SwiftUI
//
//struct WeatherWindowDetailsView: View {
//    var location : Location
//    var date = Date()
//    private let dateFormatter: DateFormatter = {
//            let formatter = DateFormatter()
//            formatter.dateStyle = .medium
//            return formatter
//        }()
//    var body: some View {
//        HStack {
//            VStack (alignment: .leading, spacing: 2) {
//                //font will need to be PLus jarkarta Sans - light , regular, bold
//                
//                MainTempView(temp: location.avgeTemp, startColor: .navyBlue1, endColor: .navyBlue1)
//                Text("\(location.name), \(location.country)")
//                    .font(Font.custom("PlusJakartaSans-Bold", size: 24))
//                    .foregroundStyle(.dark1)
//                Text("Just Updated")
//                    .font(Font.custom("PlusJakartaSans-Regular", size: 10))
//                    .foregroundStyle(.gray1)
//                    .padding(.bottom, 11)
//                    .padding(.top, -8)
//                Text("\(location.minTemp)° - \(location.maxTemp)°")
//                    .font(Font.custom("PlusJakartaSans-Bold", size: 22))
//                    .foregroundStyle(.navyBlue1)
//                Text(" partly cloudy")
//                    .font(Font.custom("PlusJakartaSans-Light", size: 11))
//                
//                    .foregroundStyle(.dark1)
//                    .padding(.bottom, 11)
//                    .padding(.top, -8)
//                Text(" \(dateFormatter.string(from: date))")
//                    .font(Font.custom("PlusJakartaSans-Regular", size: 13))
//                    .foregroundStyle(.black)
//            }
//            .padding(10)
//            Spacer()
//        }
//    }
//}
//
//#Preview {
//    WeatherWindowDetailsView(location: mockData().sampleLocation)
//}
