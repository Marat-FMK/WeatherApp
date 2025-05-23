//
//  Gradients.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 22.05.2025.
//

import SwiftUI

class Gradients {
    let iconGradient = LinearGradient(colors: [.yellow, .red, .green, .orange, .blue], startPoint: .bottomLeading, endPoint: .topTrailing)
    let currentDayGradient = LinearGradient(colors: [.appPurple, .appBlue], startPoint: .bottomLeading, endPoint: .topTrailing)
    let dayGradient = LinearGradient(colors: [.purple, .blue], startPoint: .bottomLeading, endPoint: .topTrailing)
    let errorGradient = LinearGradient(colors: [.red, .yellow], startPoint: .bottomTrailing, endPoint: .topLeading)
    
    let dayGradientOne = LinearGradient(colors: [.gradient1, .gradient2], startPoint: .bottomLeading, endPoint: .topTrailing)
    let dayGradientTwo = LinearGradient(colors: [.gradient2, .gradient3], startPoint: .bottomLeading, endPoint: .topTrailing)
    let dayGradientThree = LinearGradient(colors: [.gradient3, .gradient4], startPoint: .bottomLeading, endPoint: .topTrailing)
    let dayGradientFour = LinearGradient(colors: [.gradient4, .gradient5], startPoint: .bottomLeading, endPoint: .topTrailing)
    let dayGradientFive = LinearGradient(colors: [.gradient5, .gradient6], startPoint: .bottomLeading, endPoint: .topTrailing)
    let dayGradientSix = LinearGradient(colors: [.gradient6, .gradient7], startPoint: .bottomLeading, endPoint: .topTrailing)
    let dayGradientSeven = LinearGradient(colors: [.gradient7, .gradient8], startPoint: .bottomLeading, endPoint: .topTrailing)
    let dayGradientEight = LinearGradient(colors: [.gradient8, .red], startPoint: .bottomLeading, endPoint: .topTrailing)
    
    func setBackground(temp: Double) -> LinearGradient {
        if temp <= -10{
            return dayGradientOne
        } else if temp <= 0 {
            return dayGradientTwo
        } else if temp <= 8 {
            return dayGradientThree
        } else if temp <= 16 {
            return dayGradientFour
        } else if temp <= 22 {
            return dayGradientFive
        } else if temp <= 28 {
            return dayGradientSix
        } else if temp <= 34 {
            return dayGradientSeven
        } else {
            return dayGradientEight
        }
    }
}

