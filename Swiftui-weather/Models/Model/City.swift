//
//  Location.swift
//  Swiftui-weather
//
//  Created by Jon Spight on 3/14/24.
//

import SwiftUI

struct Locations {
    var locations : [City]
    
}

struct City : Identifiable,  Hashable {
    let id = UUID()
    let name : String
    let country: String
    let maxTemp : String
    let minTemp : String
    let avgeTemp : String
    var isFav : Bool = false
    
//    var timeline : Timeline
}

struct hourData : Identifiable {
    let id = UUID()
    var time : String
    var values : hourValuesPH
}
struct hourValuesPH {
    var temp : Double
}
struct weekData : Identifiable,  Hashable {
    let id = UUID()
    var day : String
    var temp : Double
    var abv : String
}

struct mockData {
    var sampleLocation = City(name: "Chicago",
                                  country: "US",
                                  maxTemp: "78",
                                  minTemp: "69",
                                  avgeTemp: "65")
        
    var sampleLocations = [
        City(name: "Chicago", country: "US", maxTemp: "67", minTemp: "60", avgeTemp: "65"),
    City(name: "Amsertdam", country: "NL", maxTemp: "72", minTemp: "53", avgeTemp: "70"),
    City(name: "Texas", country: "US", maxTemp: "88", minTemp: "80", avgeTemp: "82"),
    City(name: "New Jersey", country: "US", maxTemp: "64", minTemp: "72", avgeTemp: "68"),
    City(name: "California", country: "US", maxTemp: "79", minTemp: "74", avgeTemp: "77")]
    
    var hourlyData = [
        hourData(time: "2024-03-27T12:00:00Z", values: hourValuesPH(temp: 8.2)),
        hourData(time: "2024-03-27T13:00:00Z", values: hourValuesPH(temp: 8.2)),
        hourData(time: "2024-03-27T14:00:00Z", values: hourValuesPH(temp: 8.2)),
        hourData(time: "2024-03-27T15:00:00Z", values: hourValuesPH(temp: 8.2)),
        hourData(time: "2024-03-27T16:00:00Z", values: hourValuesPH(temp: 8.2)),
        hourData(time: "2024-03-27T17:00:00Z", values: hourValuesPH(temp: 8.2)),
        hourData(time: "2024-03-27T18:00:00Z", values: hourValuesPH(temp: 8.2)),
        hourData(time: "2024-03-27T19:00:00Z", values: hourValuesPH(temp: 8.2)),
        hourData(time: "2024-03-27T20:00:00Z", values: hourValuesPH(temp: 8.2)),
        hourData(time: "2024-03-27T21:00:00Z", values: hourValuesPH(temp: 8.2)),
       ]
    
    var weeklyData = [
        weekData(day: "Today", temp: 34, abv: "Mon"),
        weekData(day: "Monday", temp: 35, abv: "Tue"),
        weekData(day: "Tuesday", temp: 37, abv: "Wed"),
        weekData(day: "Wednesday", temp: 35, abv: "Thu"),
        weekData(day: "Thursday", temp: 39, abv: "Fri"),
        weekData(day: "Friday", temp: 34, abv: "Sat"),
        weekData(day: "Saturday", temp: 28, abv: "Sun")
       ]

    
}
