//
//  ErrorView.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 22.05.2025.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        VStack(spacing:  20) {
            Image(systemName: "x.square.fill")
                .resizable()
                .scaledToFit()
                .frame(height: 120)
                .foregroundStyle(.red.opacity(0.6))
            Text("""
                 An error occurred when uploading data.
                 
                 Сheck if the city is entered.
                 Check your internet connection.
                 There may be problems due to the enabled VPN.
                 """)
            .customFont(name: .pillGothic600mgSemibd, size: 20)
        }
        .padding(40)
        .background(RoundedRectangle(cornerRadius: 16)
            .foregroundStyle(Gradients().errorGradient))
    }
}

#Preview {
    ErrorView()
}
