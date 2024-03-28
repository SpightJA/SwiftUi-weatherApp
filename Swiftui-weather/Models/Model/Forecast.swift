//
//  City.swift
//  Swiftui-weather
//
//  Created by Jon Spight on 3/18/24.
//

import Foundation
import SwiftUI

struct Forecast : Codable , Identifiable {
    let id = UUID()
    var timelines : TimeLines
    var location : Location
    struct TimeLines : Codable {
        var minutely : [Minute]
        var hourly : [Hour]
        var daily : [Day]
        struct Day : Codable {
            var time : String
            var values : DayValues
        }
        struct Hour :Codable {
            var time : String
            var values : HourValues
        }
        struct Minute : Codable {
            var time : String
            var values : MinValues
        }
        
    }
    struct Location : Codable {
        var lat : Double
        var lon : Double
        var name : String
    }
    
//    struct sampleHour
    
    struct sampleData {
        
        var sampleMinValues = MinValues(temperature: 0.0)
        
//        var sampleHours = [forecast?.timelines.hourly()]
        var sampleHourValues = HourValues(temperature: 0.0)
        
        var sampleDayValues =
            DayValues(
                humidityAvg: 0.0,
                precipitationProbabilityMax: 0,
                pressureSurfaceLevelAvg: 0.0,
                temperatureApparentAvg: 0.0,
                temperatureAvg: 0.0,
                temperatureMax: 0.0,
                temperatureMin: 0.0)
        
        
       
    }
    
    func placeholder() -> Forecast {
        return Forecast(timelines: Forecast.TimeLines(minutely: [],
                                               hourly: [],
                                               daily: []),
                 location: Forecast.Location(
                    lat: 0.0,
                    lon: 0.0,
                    name: "We do not care"))
        
    }

    
}

struct DayValues : Codable {
    var humidityAvg : Double
    var precipitationProbabilityMax : Int
    var pressureSurfaceLevelAvg : Double
    var temperatureApparentAvg : Double
    var temperatureAvg: Double
    var temperatureMax: Double
    var temperatureMin: Double
//    var uvIndexAvg : Int
//    var visibilityAvg : Int
//    var weatherCodeMax: Int
//    var weatherCodeMin: Int
//    var windSpeedMax : Double
}

struct HourValues : Codable {
    var temperature : Double
}
struct MinValues : Codable {
    var temperature : Double
}

