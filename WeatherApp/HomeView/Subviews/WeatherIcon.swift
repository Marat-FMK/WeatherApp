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
                    .shadow(color: .blue, radius: 15, x: -20, y: 8)
                
            } placeholder: {
                Image(systemName: "tropicalstorm.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white.opacity(0.5))
            }
            
            Spacer()
            
            Text(description)
                .customFont(name: .pillGothic600mgBold, size: 20)
                .minimumScaleFactor(0.5)
                .lineLimit(2)
                .foregroundStyle(.white.opacity(0.6))
            
//            Button {
//                withAnimation {
//                    presentDescription.toggle()
//                }
//            } label: {
//                if presentDescription {
//                    Text(description)
//                        .customFont(name: .pillGothic600mgBold, size: 20)
//                        .minimumScaleFactor(0.5)
//                        .lineLimit(2)
//                        .foregroundStyle(.white.opacity(0.6))
//                } else {
//                Image(systemName: "questionmark.circle.dashed")
//                    .resizable()
//                    .scaledToFit()
//                    .foregroundStyle(.white.opacity(0.2))
//                    .frame(width: 60)
//            }
//            }
//            .buttonStyle(.plain)
        }
        .frame(height: 120)
    }
}

#Preview {
    WeatherIcon(url: "//cdn.weatherapi.com/weather/64x64/day/176.png", description: "Sunny / rain")
}
