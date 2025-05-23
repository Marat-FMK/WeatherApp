//
//  LocationModel.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 19.05.2025.
//

import Foundation

struct Location: Codable, Hashable, Equatable {
    let name: String?
    let region: String?
    let country: String?
}
