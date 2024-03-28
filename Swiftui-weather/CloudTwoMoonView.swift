//
//  CloudTwoMoonView.swift
//  Swiftui-weather
//
//  Created by Jon Spight on 3/12/24.
//

import SwiftUI

struct CloudTwoMoonView: View {
    var body: some View {
        ZStack {
//            Image(systemName: "moon.fill")
//                .resizable()
//                .frame(width: 220, height: 220)
//                .aspectRatio(contentMode: .fit)
//                .offset(CGSize(width: 40.0, height: -100.0))
            Image(systemName: "moon.fill")
                .resizable()
                .frame(width: 220, height: 200)
                .aspectRatio(contentMode: .fit)
                .offset(CGSize(width: -30.0, height: -100.0))
            Image(systemName: "cloud.fill")
                .resizable()
                .frame(width: 260, height: 200)
                .aspectRatio(contentMode: .fit)
                .offset(CGSize(width: 60.0, height: -50.0))
                .foregroundColor(.red)
                .opacity(0.6)
            
            Image(systemName: "cloud.fill")
                .resizable()
                .frame(width: 260, height: 200)
                .aspectRatio(contentMode: .fit)
                .offset(CGSize(width: -55.0, height: 10.0))
                .foregroundColor(.purple)
                .opacity(0.5)
//            Image(systemName: "moon.fill")
//                .resizable()
//                .frame(width: 220, height: 220)
//                .aspectRatio(contentMode: .fit)
//                .offset(CGSize(width: 40.0, height: -100.0))

        }
    }
}

#Preview {
    CloudTwoMoonView()
}
