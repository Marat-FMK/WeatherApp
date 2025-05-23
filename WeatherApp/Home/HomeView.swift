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
                               dynamicBackground: $viewModel.dynamicBackground,
                               possibleCityes: $viewModel.possibleCityes,
                               currentWeather: viewModel.currentWeather,
                               selectedScale: viewModel.selectedScale,
                               selectScale: viewModel.selectScale,
                               selectCity: viewModel.selectCity)
            
            if viewModel.presentErrorView() {
                ErrorView()
            } else {
                ForEach(viewModel.hourlyForecast.indices, id: \.description) { index in
                    OneDay(dynamicBackground: viewModel.dynamicBackground,
                           forecastDay: viewModel.forecastdays[index],
                           selectedScale: viewModel.selectedScale,
                           dayHours: viewModel.hourlyForecast[index])
                }
            }
        }
        .padding(.horizontal, 8)
        .background(.appBackground)
    }
}

#Preview {
    HomeView()
}
