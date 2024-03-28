////
////  MultiView.swift
////  Swiftui-weather
////
////  Created by Jon Spight on 3/12/24.
////
//
//
//import SwiftUI
//
//struct MultiView: View {
//    @Binding var  multiViewController : MultiViewViewController
//    @State private var forecast : Forecast?
//    
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                ContainerRelativeShape()
//                    .fill( .bg1 )
//                    .ignoresSafeArea()
//                VStack {
//                    HStack {
//                        ZStack{
//                            Rectangle()
//                                .frame(height: 35)
//                                .cornerRadius(12)
//                                .foregroundStyle(.white)
//                            HStack {
//                                Image(systemName: "circle")
//                                    .resizable()
//                                    .frame(width: 30, height: 30)
//                                    .foregroundStyle(.buttonAccent)
//                                Text("Search...")
//                                    .foregroundStyle(.gray1)
//                                Spacer()
//                            }
//                            .padding(3)
//                            Spacer()
//                        }
//                        .frame(width: .infinity, height: 50)
//                        .padding(.leading, 10)
//                    }
//                    NavigationLink(destination: WeatherHomeView(location: mockData().sampleLocation)
//                        .navigationBarBackButtonHidden(true)) {
//                        CurrentWeatherWindowView(location: mockData().sampleLocation )
//                    }
//                    ScrollView {
//                        LazyVGrid(columns: multiViewController.columns) {
//                            ForEach(mockData().sampleLocations){location in
//                                NavigationLink(destination: WeatherHomeView(location: location).navigationBarBackButtonHidden(true)) {
//                                    WeatherWindowView(location: location)
//                                        .padding(.vertical,10)
//                                }
//                            }
//                        }
//                    }
//                    
//                    Spacer()
//                }
//                .padding()
////                Circle()
////                ForEach(forecast?.timelines.minutely) { minute in
////                    minute.time
////                }
//
//                
////
////                
//                
//
//            }
//            
//        }
//    }
//}
//
//#Preview {
//    MultiView(multiViewController: .constant(MultiViewViewController()))
//}
//
////func getData() -> Void {
////    let apiService = APIService.shared.getJSON(urlString: "https://api.tomorrow.io/v4/weather/forecast?location=Chicago&apikey=xCyAtIMk1Zmvf41EaqtNPQmZSz7h8PXw") { (result: Result<Forecast, APIService.APIError>) in
////        switch result {
////        case .success(let forecast):
////            for day in forecast.TimeLines.Daily {
////                print(day.values.temperatureAvg)
////            }
////        case .failure(let apiError):
////            switch apiError {
////            case .error(let errorString):
////                print(errorString)
////            }
////        }
////        
////    }
////}
////func get2 () async throws -> Forecast {
////    let headers = ["accept": "application/json"]
////
////    let request = NSMutableURLRequest(url: NSURL(string: "https://api.tomorrow.io/v4/weather/forecast?location=new%20york&apikey=xCyAtIMk1Zmvf41EaqtNPQmZSz7h8PXw")! as URL,
////                                            cachePolicy: .useProtocolCachePolicy,
////                                        timeoutInterval: 10.0)
////    request.httpMethod = "GET"
////    request.allHTTPHeaderFields = headers
////
////    let session = URLSession.shared
////    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Forecast in
////      if (error != nil) {
////        print(error as Any)
////      } else {
////        let httpResponse = response as? HTTPURLResponse
////        print(httpResponse)
////          let decoder = JSONDecoder()
////          return try decoder.decode(Forecast.self, from: httpResponse)
//////          return
//////          return httpResponse
////      }
////    })
////
////    dataTask.resume()
////}
