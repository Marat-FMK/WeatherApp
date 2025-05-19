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
        ScrollView {
            VStack {
                CurrentWeatherView(currentWeather: viewModel.currentWeather, selectedScale: viewModel.selectedScale, selectScale: viewModel.selectScale)
                
                
            }
        }
    }
}

#Preview {
    HomeView()
}
