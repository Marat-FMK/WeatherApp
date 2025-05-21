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
    let dayHours: [Hour]
    let gradient = LinearGradient(colors: [.appPurple, .appBlue], startPoint: .bottomLeading, endPoint: .topTrailing)
    
    var body: some View {
        VStack {
            
            Text(forecastDay.date?.toDate(format: "yyyy-MM-dd")?.formatted(date: .complete, time: .omitted) ?? "")
                .customFont(name: .pillGothic600mgThin, size: 20)
                .foregroundStyle(.white.opacity(0.6))
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(dayHours, id: \.time) { hour in
                        WeatherByClock(time: hour.time ?? "no date", icon: hour.condition?.icon ?? "no icon", selectedScale: selectedScale, temperatureC: hour.temp_c ?? 0, temperatureF: hour.temp_f ?? 0)
                    }
                    .padding(.leading, 20)
                }
            }
            
            AdditionalStack(currentWind: forecastDay.day?.maxwind_kph ?? 0, currentHumidity: forecastDay.day?.avghumidity ?? 0)
            
        }
        .padding(.vertical, 20)
//        .frame(width: UIScreen.main.bounds.width)
        .background(RoundedRectangle(cornerRadius: 25).foregroundStyle(gradient))
    }
}

#Preview {
    OneDay(forecastDay: Forecastday.empty, selectedScale: "Celsius", dayHours: [Hour.empty])
}
