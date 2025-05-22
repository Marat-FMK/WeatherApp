//
//  scaleSelectionButton.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 19.05.2025.
//

import SwiftUI

struct ScaleSelectionButton: View {
    let selectedScale: String
    let buttonScale: String
    let selectScale: () -> Void
    
    var body: some View {
        Button {
            selectScale()
        } label: {
            Text( buttonScale == "Fahrenheit" ? "ºF" : "ºC")
                .customFont(name: .pillGothic600mgLight, size: 23)
                .foregroundStyle(selectedScale == buttonScale ? .purple : .white.opacity(0.9))
                .frame(width: 60, height: 60)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
                .opacity(selectedScale == buttonScale ? 1 : 0.5)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ScaleSelectionButton(selectedScale: "Celsius", buttonScale: "Fahrenheit", selectScale: {})
}
