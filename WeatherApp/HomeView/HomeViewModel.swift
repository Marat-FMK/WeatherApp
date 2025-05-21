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
    @Published var forecastdays: [Forecastday] = [Forecastday.empty]
    @Published var currentWeather: Current = Current.empty
    var daysForecast: [[Hour]] = []
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
                guard let forecastday = weather.forecast?.forecastday else {return}
                DispatchQueue.main.async {
                    self.currentWeather = current
                    self.forecast = forecast
                    self.forecastdays = forecastday
                    self.setDays()
                }
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
    
    func setDays() {
        guard let hoursDayOne = forecast.forecastday?[0].hour else {return}
        guard let hoursDayTwo = forecast.forecastday?[1].hour else {return}
        guard let hoursDayThree = forecast.forecastday?[2].hour else {return}
        guard let hoursDayFour = forecast.forecastday?[3].hour else {return}
        guard let hoursDayFive = forecast.forecastday?[4].hour else {return}
        
        let dayOne = [hoursDayOne[5], hoursDayOne[11],hoursDayOne[15], hoursDayOne[18], hoursDayOne[21]]
        let dayTwo = [hoursDayTwo[5], hoursDayTwo[11],hoursDayTwo[15], hoursDayTwo[18], hoursDayTwo[21]]
        let dayThree = [hoursDayThree[5], hoursDayThree[11],hoursDayThree[15], hoursDayThree[18], hoursDayThree[21]]
        let dayFour = [hoursDayFour[5], hoursDayFour[11],hoursDayFour[15], hoursDayFour[18], hoursDayFour[21]]
        let dayFive = [hoursDayFive[5], hoursDayFive[11],hoursDayFive[15], hoursDayFive[18], hoursDayFive[21]]
        
        daysForecast = [dayOne, dayTwo, dayThree, dayFour, dayFive]
    }
    
}
