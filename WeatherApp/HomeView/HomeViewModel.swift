//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 18.05.2025.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @AppStorage("selectedCity") var selectedCity: String = "Moscow"
    @AppStorage("selectedScale") var selectedScale = "Celsius"
    @Published var possibleCityes: [Location] = []
    @Published var forecast: Forecast = Forecast.empty
    @Published var currentWeather: Current = Current.empty
    let networkManager = NetworkManager()
    
    init() {
        fetchWeather()
    }
    
    func selectScale() {
        selectedScale = selectedScale == "Celsius" ? "Fahrenheit" : "Celsius"
    }
    
    func fetchWeather() {
        networkManager.fetchWeather(city: selectedCity) { result in
            switch result {
            case .success(let weather):
                guard let current = weather.current else {return}
                guard let forecast = weather.forecast else {return}
                self.currentWeather = current
                self.forecast = forecast
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchCountryes() {
        networkManager.fetchCityes(searchText: selectedCity) { result in
            switch result {
            case .success(let cityes):
                self.possibleCityes = cityes
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}
