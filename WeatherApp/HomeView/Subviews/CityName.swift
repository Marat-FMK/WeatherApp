//
//  CityName.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 22.05.2025.
//

import SwiftUI

struct CityName: View {
    @FocusState.Binding var fieldInFocused: Bool
    let city: Location
    let fetchWeather: () -> Void
    let selectCity: (Location) -> Void
    
    var body: some View {
        HStack {
            Text(city.name ?? "no name")
                .foregroundStyle(.white)
                .customFont(name: .pillGothic600mgSemibd, size: 20)
            Spacer()
            VStack(alignment: .trailing, spacing: 2) {
                Text(city.region ?? "no region")
                Text(city.country ?? "no country")
            }
            .foregroundStyle(.white.opacity(0.6))
            .customFont(name: .pillGothic600mgThin, size: 15)
            .minimumScaleFactor(0.5)
        }
        .padding(5)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
        .onTapGesture {
            selectCity(city)
            fieldInFocused = false
        }
    }
}
