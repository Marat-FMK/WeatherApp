//
//  SearchTextField.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 18.05.2025.
//

import SwiftUI

struct SearchTextField: View {
    @FocusState.Binding var fieldInFocused: Bool
    @Binding var searchText: String
    let fetchWeather: () -> Void
    
    var body: some View {
        HStack {
            Image(systemName: "mappin.and.ellipse")
                .resizable()
                .scaledToFit()
                .frame(height: 20)
                .foregroundStyle(.white.opacity(0.6))
                .padding(.vertical, 5)
                .padding(.trailing, 10)
            
            TextField("", text: $searchText, prompt: Text("Enter city").foregroundColor(.white.opacity(0.3)))
                .foregroundStyle(.white.opacity(0.6))
                .customFont(name: .pillGothic600mgSemibd, size: 25)
                .minimumScaleFactor(0.6)
                .focused($fieldInFocused)
            
            Button {
                withAnimation {
                    fieldInFocused = false
                    fetchWeather()
                }
            } label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white.opacity(0.4))
                    .padding(8)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
//                    .foregroundStyle(.secondary)
                    .frame(height: 60)
            }
        }
    }
}
//
//#Preview {
//    SearchTextField( fieldInFocused: ,searchText: .constant("Delphi, India"), searchForecast: {})
//}
