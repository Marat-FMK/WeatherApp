//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 18.05.2025.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @AppStorage("selectedScale") var selectedScale = "Celsius"
    @AppStorage("dynamicBackground") var dynamicBackground = false
    @AppStorage("selectedCity") var selectedCity: String = "Moscow, Russia" {
        didSet {
            uploudCityes()
        }
    }
    @Published var possibleCityes: [Location] = []
    @Published var forecast: Forecast = Forecast.empty
    @Published var forecastdays: [Forecastday] = [Forecastday.empty]
    @Published var currentWeather: Current = Current.empty
    @Published var hourlyForecast: [[Hour]] = []
    let networkManager = NetworkManager()
    var callFetchCityes = true
    
    init() {
        fetchWeather()
    }
    
    func fetchWeather() {
        networkManager.fetch(city: selectedCity, endpoint: .forecast) { (result: Result<Weather, NetworkError>) in
            switch result {
            case .success(let weather):
                guard let current = weather.current else {
                    DispatchQueue.main.async{
                        self.currentWeather = Current.empty
                    }
                    return
                }
                guard let forecast = weather.forecast else {return}
                guard let forecastday = weather.forecast?.forecastday else {return}
                DispatchQueue.main.async {
                    self.currentWeather = current
                    self.forecast = forecast
                    self.forecastdays = forecastday
                    self.setDays()
                    self.possibleCityes = []
                    self.callFetchCityes = true
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self.currentWeather = Current.empty
                    self.hourlyForecast = []
                }
            }
        }
    }
    
    func fetchCityes() {
        networkManager.fetch(city: selectedCity, endpoint: .search){ (result: Result<[Location], NetworkError>) in
            switch result {
            case .success(let cityes):
                DispatchQueue.main.async {
                    self.possibleCityes = cityes
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func selectCity(location: Location) {
        guard let locationName = location.name, let locationCountry = location.country else {
            selectedCity = "Moscow Russia";
            possibleCityes = [];
            fetchWeather();
            return}
        
        callFetchCityes = false
        selectedCity = locationCountry.isEmpty ? locationName : locationName + ", " + locationCountry
        possibleCityes = []
        fetchWeather()
    }
    
    func uploudCityes() {
        if self.callFetchCityes {
            self.fetchCityes()
        }
    }
    
    func presentErrorView() -> Bool {
        return hourlyForecast.isEmpty || currentWeather == Current.empty ? true : false
    }
    
    func setDays() {
        guard let hoursDayOne = forecast.forecastday?[0].hour,
              let hoursDayTwo = forecast.forecastday?[1].hour,
              let hoursDayThree = forecast.forecastday?[2].hour,
              let hoursDayFour = forecast.forecastday?[3].hour,
              let hoursDayFive = forecast.forecastday?[4].hour else { hourlyForecast = []; return }
        
        let dayOne = [hoursDayOne[5], hoursDayOne[11],hoursDayOne[15], hoursDayOne[18], hoursDayOne[21]]
        let dayTwo = [hoursDayTwo[5], hoursDayTwo[11],hoursDayTwo[15], hoursDayTwo[18], hoursDayTwo[21]]
        let dayThree = [hoursDayThree[5], hoursDayThree[11],hoursDayThree[15], hoursDayThree[18], hoursDayThree[21]]
        let dayFour = [hoursDayFour[5], hoursDayFour[11],hoursDayFour[15], hoursDayFour[18], hoursDayFour[21]]
        let dayFive = [hoursDayFive[5], hoursDayFive[11],hoursDayFive[15], hoursDayFive[18], hoursDayFive[21]]
        
        hourlyForecast = [dayOne, dayTwo, dayThree, dayFour, dayFive]
    }
    
    func selectScale() {
        selectedScale = selectedScale == "Celsius" ? "Fahrenheit" : "Celsius"
    }
}
