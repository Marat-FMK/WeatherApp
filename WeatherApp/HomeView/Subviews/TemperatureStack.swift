//
//  TemperatureStack.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 19.05.2025.
//

import SwiftUI

struct TemperatureStack: View {
    let temperatureC: Double
    let temperatureF: Double
    let selectedScale: String
    let selectScale: () -> Void
    
    var body: some View {
        HStack {
            HStack(alignment: .top) {
                Text(String(selectedScale == "Celsius" ? temperatureC : temperatureF))
                    .lineLimit(1)
                    .customFont(name: .pillGothic600mgThin, size: 120)
                    .minimumScaleFactor(0.8)
                    .foregroundStyle(.white)
                    .shadow(color: .gray.opacity(0.6), radius: 1, x: -5, y: 3)
                
                Text(selectedScale == "Celsius" ? "ºC" : "ºF")
                    .customFont(name: .pillGothic600mgLight, size: 20)
                    .foregroundStyle(.white.opacity(0.6))
                    .shadow(color: .gray.opacity(0.6), radius: 1, x: -5, y: 3)
            }
            
            Spacer()
            
            VStack(spacing: -8) {
                ScaleSelectionButton(selectedScale: selectedScale, buttonScale: "Celsius", selectScale: selectScale)
                
                ScaleSelectionButton(selectedScale: selectedScale, buttonScale: "Fahrenheit", selectScale: selectScale)
            }
        }
    }
}

#Preview {
    TemperatureStack(temperatureC: 31.7, temperatureF: 55.1, selectedScale: "Fahrenheit", selectScale: {})
}
