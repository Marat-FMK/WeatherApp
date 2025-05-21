//
//  WeatherIcon.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 19.05.2025.
//

import SwiftUI

struct WeatherIcon: View {
    @State private var presentDescription = false
    let url: String
    let description: String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https:" + (url))) { Icon in
                Icon
                    .resizable()
                    .scaledToFit()
                    .shadow(color: .blue, radius: 30, x: -25, y: 10)
                    .shadow(color: .purple, radius: 30, x: 60 , y: -35)
                    .shadow(color: .yellow, radius: 40, x: 30 , y: 30)
            } placeholder: {
                Image(systemName: "tropicalstorm.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white.opacity(0.6))
            }
        
            Spacer()
            
            Text(description)
                .customFont(name: .pillGothic600mgBold, size: 20)
                .minimumScaleFactor(0.5)
                .lineLimit(2)
                .foregroundStyle(.white.opacity(0.6))
        }
        .frame(height: 120)
    }
}

#Preview {
    WeatherIcon(url: "//cdn.weatherapi.com/weather/64x64/day/176.png", description: "Sunny / rain")
}
