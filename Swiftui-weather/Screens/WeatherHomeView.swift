//
//  ContentView.swift
//  Swiftui-weather
//
//  Created by Jon Spight on 3/7/24.
//

//IDEA - get real Weather api data
//IDEA - Build a tab bar that shows multiple cities

import SwiftUI
import Foundation

struct WeatherHomeView: View {
    @State private var isFav =   false
    @State var isPresented = false
    var location : City
    @State var forecast : Forecast?
    var cityName : String {
        var arr = forecast?.location.name.components(separatedBy: ",")
        return arr?[0] ?? "N/A"
    }
    
//    @State var multiViewController  = MultiViewViewController()
    var body: some View {
        NavigationStack {
            ZStack {
                ContainerRelativeShape()
                    .fill( .bg1 )
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
//                    HStack {
//                        Button(action: {
//                            isFav.toggle()
//                            multiViewController.listOfLocations.append(forecast ?? Forecast(timelines: Forecast.TimeLines(minutely: [Forecast.TimeLines.Minute(time: "N/A", values: Forecast.sampleData().sampleMinValues)], hourly: [Forecast.TimeLines.Hour(time: "N/A", values: Forecast.sampleData().sampleHourValues)], daily: [Forecast.TimeLines.Day(time: "N/A", values: Forecast.sampleData().sampleDayValues)]), location: Forecast.Location(lat: 0.0, lon: 0.0, name: "N/A")))
//                            
//                            print(multiViewController.listOfLocations)
//                        }, label: {
//                            isFav ? Image(systemName: "star.fill")
//                                .resizable()
//                                .frame(width: 20, height: 20)
//                                 :
//                            Image(systemName: "star")
//                                .resizable()
//                                .frame(width: 20, height: 20)
////                                .foregroundStyle(.cloudyBlue)
//                        }
//                        ).foregroundStyle(.buttonAccent)
//                        
//                        Spacer()
//                        //add this to the tool bar
//                        NavigationLink {
//                            MultiView(multiViewController: $multiViewController)
//                                .navigationBarBackButtonHidden(true)
//                        } label: {
//                            Image(systemName: "line.2.horizontal.decrease.circle")
//                                .foregroundStyle(.buttonAccent)
//                        }
//                    }
//                    .foregroundColor(.navyBlue1)
//                    .padding()
                    
                    WeatherIcon(temp: Int(forecast?.timelines.minutely[0].values.temperature ?? 23)) //use minute temp here
                    
                    Spacer()
                    WeatherUpdateView(forecast: forecast, name: cityName)
                    Spacer()
                    Button(action: {isPresented.toggle()}, label: {
                        Label("More Data", systemImage: "ellipsis.rectangle")
                            .foregroundStyle(.buttonAccent)
                    })                    
                }
            }
            .sheet(isPresented: $isPresented) {
                
                LocationDataView(name: forecast?.location.name, hourlyData: forecast?.timelines.hourly)
                    .presentationDetents([ .fraction(0.8)])
                    
            }
            
        }
        .task {
            do {
                forecast = try await getForecast()
                print(forecast?.timelines.hourly)
            }
            catch WeError.invalidURL {
                print("bad url")
            }catch WeError.invalidResponse {
                print("bad response")
            }catch WeError.invalidData {
                print("bad data")
            }catch {
                print("unexpected")
            }
        }
    }
}


#Preview {
    WeatherHomeView( location: mockData().sampleLocation)
}


func getForecast() async throws -> Forecast {
    let endpoint="https://api.tomorrow.io/v4/weather/forecast?location=new%20york&apikey=xCyAtIMk1Zmvf41EaqtNPQmZSz7h8PXw"
    guard let url = URL(string: endpoint) else {
        throw WeError.invalidURL
    }
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw WeError.invalidResponse}
    
    do {
        print(data)
        let decoder = JSONDecoder()
//        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(Forecast.self, from: data)
        
    } catch {
        throw WeError.invalidData
    }
    
}

enum WeError : Error {
    case invalidURL
    case invalidResponse
    case invalidData
}


//struct WeatherDayView: View {
//    var dayOfWeek   : String
//    var imageName   : String
//    var temp        : Int
//
//    var body: some View {
//        VStack {
//            Text(dayOfWeek)
//                .font(.system(size: 24, weight: .regular, design: .default))
//                .foregroundColor(.white)
//            Image(systemName: imageName)
//                .symbolRenderingMode(.palette)
//                .foregroundStyle(.purple1, .red)
//            Text("\(temp)°")
//                .font(.system(size: 30, weight: .regular, design: .default))
//                .foregroundColor(.white)
//        }
//    }
//}

//struct BackgroundView: View {
//    var isNight     : Bool
//    var body: some View {
//
//        ContainerRelativeShape()
//            .fill( isNight ? Color.black.gradient : Color.blue.gradient)
//            .ignoresSafeArea()
//    }
//}

//struct CityTextView: View {
//    var cityName : String
//    var body: some View {
//        Text(cityName)
//            .font(.system(size: 32, weight: .medium, design: .default))
//            .foregroundColor(.white)
//            .padding()
//    }
//}

//struct MainWeatherStatusView: View {
//    var imageName   : String
//    var temp        : Int
//    var body: some View {
//        VStack (spacing: 8) {
//            Image(systemName: imageName)
//                .symbolRenderingMode(.multicolor)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 180, height: 180)
//            Text("\(temp)°")
//                .font(.system(size: 70, weight: .medium, design: .default))
//                .foregroundColor(.white)
//
//        }
//        .padding(.bottom, 40 )
//    }
//}


struct WeatherUpdateView: View {
    var forecast : Forecast?
    var name : String
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    var max : Int {
        return  conversion(temp: (Int(forecast?.timelines.daily[0].values.temperatureMax ?? 0)))
    }
    var min : Int {
        return  conversion(temp: (Int(forecast?.timelines.daily[0].values.temperatureMin ?? 0)))
    }
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 2) {
                //font will need to be PLus jarkarta Sans - light , regular, bold
                Text("\(name)")
                    .font(.system(size: 40))
                    .bold()
                    .foregroundStyle(.titleAccent)
                Text(" Updated Now")
                    .font(.system(size: 12))
                    .foregroundStyle(.gray)
                    .padding(.top, -10)
                    .padding(.bottom, 10)
                
                Text("\(min)° - \(max)°")
                    .font(.system(size: 40))
                    .bold()
                    .foregroundStyle(.buttonAccent)
                Text(" partly cloudy")
                    .font(.system(size: 12))
                    .foregroundStyle(.titleAccent)
                    .padding(.top, -10)
                    .padding(.bottom, 20)
                Text(" \( dateFormatter.string(from: Date.now))")
                    .foregroundStyle(.titleAccent)

            }
            .padding(.leading, 40)
            Spacer()
        }
    }
  
}

struct WeatherIcon: View {
    var temp : Int
    var convertedTemp : Int {
        return conversion(temp: temp)
    }
    var body: some View {
        ZStack {
            
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 120, height: 120)
                .aspectRatio(contentMode: .fit)
                .offset(CGSize(width: -20.0, height: 0.0))
                .foregroundStyle(
                    .linearGradient(colors: [.yellow1, .orange1], startPoint: .top, endPoint: .bottom)
                )
            
                .shadow(color: .yellow1, radius: 10, x: 0.0, y: 3.0)
            Text("\(convertedTemp)°")
                .font(Font.custom("PlusJakartaSans-Bold", size: 110))
                .foregroundStyle(
                    LinearGradient(gradient: Gradient(colors: [.yellow1.opacity(0.8), .navyBlue1]), startPoint: .bottomLeading, endPoint: .top))
                .offset(CGSize(width: 90.0, height: -50.0))
            Image(systemName: "cloud.fill")
                .resizable()
                .frame(width: 200, height: 160)
                .aspectRatio(contentMode: .fit)
                .offset(CGSize(width: -65.0, height: 75.0))
                .foregroundStyle(.darkendWhite1)
                .opacity(0.5)
                .shadow( radius: 5, x: 2.0, y: 7.0)
            Image(systemName: "cloud.fill")
                .resizable()
                .frame(width: 140, height: 130)
                .aspectRatio(contentMode: .fit)
                .offset(CGSize(width: 45.0, height: 30.0))
                .foregroundStyle(.darkendWhite1)
                .opacity(0.6)
                .shadow( radius: 5, x: 2.0, y: 2.0)
            
        }
    }
    

}

func conversion (temp: Int) -> Int {
    return (temp * (9/5)) + 32
}
