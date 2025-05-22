//
//  ContentView.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 18.05.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            CurrentWeatherView(searchText: $viewModel.selectedCity,
                               possibleCityes: $viewModel.possibleCityes,
                               currentWeather: viewModel.currentWeather,
                               selectedScale: viewModel.selectedScale,
                               selectScale: viewModel.selectScale,
                               fetchWeather: viewModel.fetchWeather,
                               selectCity: viewModel.selectCity)
            
            if viewModel.hourlyForecast.isEmpty {
                ErrorView()
            } else {
                ForEach(viewModel.hourlyForecast.indices, id: \.description) { index in
                    OneDay(forecastDay: viewModel.forecastdays[index],
                           selectedScale: viewModel.selectedScale,
                           dayHours: viewModel.hourlyForecast[index])
                }
            }
        }
        .padding(.horizontal, 16)
        .background(.appBackground)
    }
}

#Preview {
    HomeView()
}
