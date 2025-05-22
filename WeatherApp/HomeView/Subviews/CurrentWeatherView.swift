//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 19.05.2025.
//

import SwiftUI

struct CurrentWeatherView: View {
    @Binding var searchText: String
    @Binding var dynamicBackground: Bool
    @Binding var possibleCityes: [Location]
    @FocusState var fieldInFocused: Bool
    let currentWeather: Current
    let selectedScale: String
    let gradient = Gradients()
    let selectScale: () -> Void
    let fetchWeather: () -> Void
    let selectCity: (Location) -> Void
    
    var body: some View {
        ZStack {
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture {
                    fieldInFocused = false
                }
            VStack(spacing: 10) {
                SearchTextField(fieldInFocused: $fieldInFocused, searchText: $searchText, dynamicBackground: $dynamicBackground, fetchWeather: fetchWeather)
                
                if possibleCityes.isEmpty {
                    
                    VStack {
                        WeatherIcon(url: currentWeather.condition?.icon ?? "", description: currentWeather.condition?.text ?? "no description")
                        TemperatureStack(temperatureC: currentWeather.temp_c ?? 0, temperatureF: currentWeather.temp_f ?? 0, selectedScale: selectedScale, selectScale: selectScale)
                        AdditionalStack(currentWind: currentWeather.wind_kph ?? 0, currentHumidity: currentWeather.humidity ?? 0)
                    }
                } else {
                    ForEach(possibleCityes, id: \.country) { city in
                        CityName( fieldInFocused: $fieldInFocused, city: city, fetchWeather: fetchWeather, selectCity: selectCity)
                    }
                }
            }
        }
        .padding(20)
        .background {
            RoundedRectangle(cornerRadius: 30)
                .foregroundStyle(dynamicBackground ? gradient.setBackground(temp: currentWeather.temp_c ?? 15) : gradient.currentDayGradient)
        }
    }
}

#Preview {
    CurrentWeatherView(searchText: .constant("Moscow"), dynamicBackground: .constant(false), possibleCityes: .constant([]), currentWeather: Current(condition: Condition(text: "Patchy rain nearby", icon: "//cdn.weatherapi.com/weather/64x64/day/176.png"), temp_c: 19, temp_f: 0.0, wind_kph: 2, humidity: 69), selectedScale: "Celsius", selectScale: {},fetchWeather: {}, selectCity: {_ in})
}
