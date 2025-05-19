//
//  WeatherOfClock.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 20.05.2025.
//

import Foundation

struct WeatherOfDay: Identifiable {
    let id = UUID()
    let hours: [WeatherOfTime]
}

struct WeatherOfTime: Identifiable {
    let id = UUID()
    let time: String
    let icon: String
    let tempC: Double
    let tempF: Double
}
