//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 18.05.2025.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    let network = NetworkManager()
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
