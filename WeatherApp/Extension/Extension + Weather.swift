//
//  Extension + Weather.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 19.05.2025.
//

import Foundation

extension Weather {
    static let empty = Weather(
        current: Current.empty,
        forecast: Forecast.empty
    )
}

extension Current {
    static let empty = Current(
        condition: Condition.empty,
        temp_c: 0.0,
        temp_f: 0.0,
        wind_kph: 0.0,
        humidity: 0.0
    )
}

extension Forecast {
    static let empty = Forecast(
        forecastday: []
    )
}

extension Forecastday {
    static let empty = Forecastday(
        date: "",
        day: Day.empty,
        hour: [Hour.empty]
    )
}

extension Day {
    static let empty = Day(
        avgtemp_c: 0.0,
        avgtemp_f: 0.0,
        maxwind_kph: 0.0,
        avghumidity: 0.0,
        condition: Condition.empty,
    )
}

extension Hour {
    static let empty = Hour(
        time: "",
        condition: Condition.empty,
        temp_c: 0.0,
        temp_f: 0.0)
}

extension Condition {
    static let empty = Condition(
        text: "",
        icon: ""
    )
}
