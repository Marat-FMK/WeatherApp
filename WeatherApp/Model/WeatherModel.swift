//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 18.05.2025.
//

import Foundation


struct Weather: Codable {
    let current: Current?
    let forecast: Forecast?
}

struct Current: Codable, Equatable {
    static func == (lhs: Current, rhs: Current) -> Bool {
        lhs.temp_c == rhs.temp_c
    }
    
    let condition: Condition?
    let temp_c: Double?
    let temp_f: Double?
    let wind_kph: Double?
    let humidity: Double?
}

struct Forecast: Codable {
    let forecastday: [Forecastday]?
}

struct Forecastday: Codable {
    let date: String?
    let day: Day?
    let hour: [Hour]?
}

struct Day: Codable {
    let avgtemp_c: Double?
    let avgtemp_f: Double?
    let maxwind_kph: Double?
    let avghumidity: Double?
    let condition: Condition?
}

struct Hour: Codable {
    let time: String?
    let condition: Condition?
    let temp_c: Double?
    let temp_f: Double?
}

struct Condition: Codable {
    let text: String?
    let icon: String?
}

