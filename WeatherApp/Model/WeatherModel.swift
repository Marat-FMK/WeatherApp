//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 18.05.2025.
//

import Foundation

struct Location: Codable {
    let name: String?
    let region: String?
    let country: String?
}

struct Weather: Codable {
    let current: Current?
    let forecast: Forecast?
}

struct Current: Codable {
    let condition: Condition?
    let temp_c: Double?
    let wind_kph: Double?
    let humidity: Double?
}

struct Forecast: Codable {
    let forecastday: [Forecastday]?
}

struct Forecastday: Codable {
    let date: String?
    let day: Day?
}

struct Day: Codable {
    let avgtemp_c: Double?
    let maxwind_kph: Double?
    let avghumidity: Double?
    let condition: Condition?
}


struct Condition: Codable {
    let text: String?
    let icon: String?
}

