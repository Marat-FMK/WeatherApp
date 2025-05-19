//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 19.05.2025.
//

import SwiftUI

struct CurrentWeatherView: View {
    @State private var presentText = false
    let currentWeather: Current
    let selectedScale: String
    let gradient = LinearGradient(colors: [.purple, .blue], startPoint: .bottomLeading, endPoint: .topTrailing)
    let selectScale: () -> Void
    
    var body: some View {
        
        VStack(spacing: 10) {
            // Search
            SearchTextField(searchText: .constant("Moscow"))
            
            // // ICON
            WeatherIcon(url: currentWeather.condition?.icon ?? "", description: currentWeather.condition?.text ?? "no description")
            
            // // TEMP
            TemperatureStack(temperatureC: currentWeather.temp_c ?? 0, temperatureF: currentWeather.temp_f ?? 0, selectedScale: selectedScale, selectScale: selectScale)
           
            // // AdditionalInfo
            AdditionalStack(currentWind: currentWeather.wind_kph ?? 0, currentHumidity: currentWeather.humidity ?? 0)
        }
        .padding(20)
        .background {
            RoundedRectangle(cornerRadius: 30)
                .foregroundStyle(gradient)
        }
    }
}

#Preview {
    CurrentWeatherView(currentWeather: Current(condition: Condition(text: "Patchy rain nearby", icon: "//cdn.weatherapi.com/weather/64x64/day/176.png"), temp_c: 19, temp_f: 0.0, wind_kph: 2, humidity: 69), selectedScale: "Celsius", selectScale: {})
}
