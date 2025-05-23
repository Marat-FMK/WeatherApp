//
//  TimeOfDay.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 19.05.2025.
//

import SwiftUI

struct WeatherByClock: View {
    let time: String
    let icon: String
    let selectedScale: String
    let temperatureC: Double
    let temperatureF: Double
    
    var body: some View {
        VStack {
            Text(String(selectedScale == "Celsius" ? temperatureC : temperatureF))
                .customFont(name: .pillGothic600mgLight, size: 25)
                .foregroundStyle(.white)
            
            AsyncImage(url: URL(string: "https:" + icon)) { Icon in
                Icon
                    .resizable()
                    .scaledToFit()
                    .opacity(0.6)
            } placeholder: {
                Image(systemName: "tropicalstorm.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white.opacity(0.6))
            }
            
            Text(time.toDate()?.formatted(date: .omitted, time: .shortened) ?? "")
                .customFont(name: .pillGothic600mgBold, size: 20)
                .foregroundStyle(.white.opacity(0.6))
        }
        .frame(width: 60, height: 120)
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    WeatherByClock(time: "2025-05-25 19:00",
                   icon: "//cdn.weatherapi.com/weather/64x64/day/176.png",
                   selectedScale: "Celsius",
                   temperatureC: 25.0,
                   temperatureF: 99.1)
}
