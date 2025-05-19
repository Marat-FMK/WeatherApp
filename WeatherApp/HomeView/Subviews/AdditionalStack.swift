//
//  AdditionalStack.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 19.05.2025.
//

import SwiftUI

struct AdditionalStack: View {
    let currentWind: Double
    let currentHumidity: Double
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            AdditionalInfo(title: "Wind", value: currentWind)
            RoundedRectangle(cornerRadius: 5)
                .foregroundStyle(.gray.opacity(0.6))
                .frame(width: 2, height: 40)
            AdditionalInfo(title: "Humidity", value: currentHumidity)
                .padding(.leading, 15)
        }
    }
}

#Preview {
    AdditionalStack(currentWind: 1.4, currentHumidity: 69)
}
