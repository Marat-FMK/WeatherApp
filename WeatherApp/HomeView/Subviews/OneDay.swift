//
//  ForecastDay.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 19.05.2025.
//

import SwiftUI

struct OneDay: View {
    let forecastDay: Forecastday
    let selectedScale: String
    let hours: [Hour]
    let gradient = LinearGradient(colors: [.purple, .blue], startPoint: .bottomLeading, endPoint: .topTrailing)
    let hoursForecast: [Hour]
    var body: some View {
        VStack {
            
            Text(forecastDay.date ?? "no date *(")
                .customFont(name: .pillGothic600mgSemibd, size: 20)
                .foregroundStyle(.white.opacity(0.6))
            
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(hours, id: \.time) { hour in
                        WeatherByClock(time: hour.time ?? "no date", icon: hour.condition?.icon ?? "no icon", selectedScale: selectedScale, temperatureC: hour.temp_c ?? 0, temperatureF: hour.temp_f ?? 0)
                    }
                }
            }
            
            AdditionalStack(currentWind: forecastDay.day?.maxwind_kph ?? 0, currentHumidity: forecastDay.day?.avghumidity ?? 0)
            
        }
        .frame(width: UIScreen.main.bounds.width) // ??
        .background(RoundedRectangle(cornerRadius: 25).foregroundStyle(gradient))
        .padding(20)
    }
}

#Preview {
    OneDay(forecastDay: Forecastday.empty, selectedScale: "Celsius", hours: [Hour.empty], hoursForecast: [Hour.empty])
}
