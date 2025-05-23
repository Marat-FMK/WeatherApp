//
//  ForecastDay.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 19.05.2025.
//

import SwiftUI

struct OneDay: View {
    let dynamicBackground: Bool
    let forecastDay: Forecastday
    let selectedScale: String
    let dayHours: [Hour]
    let gradient = Gradients()
    
    var body: some View {
        VStack {
            Text(forecastDay.date?.toDate(format: "yyyy-MM-dd")?.formatted(date: .complete, time: .omitted) ?? "")
                .customFont(name: .pillGothic600mgThin, size: 20)
                .foregroundStyle(.white.opacity(0.6))
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(dayHours, id: \.time) { hour in
                        WeatherByClock(time: hour.time ?? "no date",
                                       icon: hour.condition?.icon ?? "no icon",
                                       selectedScale: selectedScale,
                                       temperatureC: hour.temp_c ?? 0,
                                       temperatureF: hour.temp_f ?? 0)
                    }
                    .padding(.leading,20)
                }
            }
            
            AdditionalStack(currentWind: forecastDay.day?.maxwind_kph ?? 0,
                            currentHumidity: forecastDay.day?.avghumidity ?? 0)
        }
        .padding(.vertical, 20)
        .background(RoundedRectangle(cornerRadius: 30).foregroundStyle(.black).opacity(0.2))
        .background(RoundedRectangle(cornerRadius: 30)
            .foregroundStyle( dynamicBackground ? gradient.setBackground(temp: dayHours[2].temp_c ?? 15).opacity(0.95) : gradient.dayGradient.opacity(0.95) ))
    }
}

#Preview {
    OneDay(dynamicBackground: false,
           forecastDay: Forecastday.empty,
           selectedScale: "Celsius",
           dayHours: [Hour.empty])
}
