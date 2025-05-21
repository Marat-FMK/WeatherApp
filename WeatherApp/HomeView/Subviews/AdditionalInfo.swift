//
//  AdditionalInfo.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 19.05.2025.
//

import SwiftUI

struct AdditionalInfo: View {
    let title: String
    let value: Double
    
    var body: some View {
        
//        VStack {
//            HStack {
//                Image(systemName: title == "Wind" ? "wind" : "humidity")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(height: 25)
//                    
//                Text(title)
//                    .customFont(name: .pillGothic600mgSemibd, size: 15)
//            }
//            HStack {
//                Text(String(value))
//                Text(title == "Wind" ? "km/h" : "%")
//            }
//        }
//        .foregroundStyle(.white.opacity(0.8))
//        .frame(width: 100, height: 50)
////        .background(.green)
    
        VStack {
            HStack {
                Image(systemName: title == "Wind" ? "wind" : "humidity")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                    
                Text(title)
                    .customFont(name: .pillGothic600mgSemibd, size: 15)
            }
            HStack {
                Text(String(value))
                Text(title == "Wind" ? "km/h" : "%")
            }
        }
        .foregroundStyle(.white.opacity(0.8))
        .frame(width: 100, height: 50)
//        .background(.green)
    }
}

#Preview {
    AdditionalInfo(title: "Humidity", value: 1.4)
}
