//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 18.05.2025.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var forecast: [String] = []
    
    
}
