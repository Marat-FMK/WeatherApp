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
    @Binding var dynamicBackground: Bool
    @State private var animation = false
    @State private var scale = false
    let fetchWeather: () -> Void
    
    var body: some View {
        HStack {
            Button {
                withAnimation(.smooth(duration: 1.0)) {
                    animation.toggle()
                    scale = true
                    dynamicBackground.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.95) {
                    scale = false
                }
            } label: {
                Image("magicBackground")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                    .foregroundStyle(dynamicBackground ? .red : .white.opacity(0.6))
                    .padding(.vertical, 5)
                    .padding(.trailing, 10)
                    .scaleEffect(scale ? 1.8 : 1)
                    .rotation3DEffect(.degrees(animation ? 720 : 0), axis: (x: 1, y: 1, z: 1))
            }
            .buttonStyle(.plain)
            
            Image(systemName: "mappin.and.ellipse")
                .resizable()
                .scaledToFit()
                .frame(height: 20)
                .foregroundStyle(.white.opacity(0.6))
                .padding(.horizontal,5)
            
            
            HStack {
                TextField("", text: $searchText, prompt: Text("Enter city").foregroundColor(.white.opacity(0.3)))
                    .foregroundStyle(.white.opacity(0.6))
                    .customFont(name: .pillGothic600mgSemibd, size: 25)
                    .minimumScaleFactor(0.4)
                    .shadow(color: .black, radius: 7, y: 5)
                    .focused($fieldInFocused)
                
                if fieldInFocused {
                    Button{
                        searchText = ""
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                            .foregroundStyle(.white.opacity(0.6))
                    }
                }
            }
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
                    .frame(height: 60)
            }
        }
    }
}
