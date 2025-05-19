//
//  TemperatureStack.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 19.05.2025.
//

import SwiftUI

struct TemperatureStack: View {
    let temperature: Double
    let selectedScale: String
    let selectScale: () -> Void
    
    var body: some View {
        HStack {
            HStack(alignment: .top) {
                Text(String(temperature))
                    .customFont(name: .pillGothic600mgThin, size: 120)
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
    TemperatureStack(temperature: 31.7, selectedScale: "Fahrenheit", selectScale: {})
}
