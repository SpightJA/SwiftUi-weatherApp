//
//  Days.swift
//  Swiftui-weather
//
//  Created by Jon Spight on 3/7/24.
//

import SwiftUI

struct Days  {

    var days = [Day(title: "Tue", imageName: "cloud.sun.fill", temp: 74),
                Day(title: "Wed", imageName: "sun.max.fill", temp: 70),
                Day(title: "Thur", imageName: "wind", temp: 66),
                Day(title: "Fri", imageName: "sun.and.horizon.fill", temp: 60),
                Day(title: "Sat", imageName: "moon.stars.fill", temp: 55)
    ]
}

struct Day : Identifiable, Hashable{
    var id = UUID()
    var title : String
    var imageName : String
    var temp : Int
}
