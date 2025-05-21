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
                
                CurrentWeatherView(currentWeather: viewModel.currentWeather, selectedScale: viewModel.selectedScale, selectScale: viewModel.selectScale)
                
                ForEach(viewModel.daysForecast.indices, id: \.description) { index in
                    
                    OneDay(forecastDay: viewModel.forecastdays[index], selectedScale: viewModel.selectedScale, dayHours: viewModel.daysForecast[index])
                    
                }
            }
//        .ignoresSafeArea()
        .padding(.horizontal, 16)
        .background(.appBackground)
    }
}

#Preview {
    HomeView()
}
