//
//  Extension + View.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 19.05.2025.
//

import SwiftUI

enum FontsNames: String {
    case pillGothic600mgLight = "Pill Gothic 600mg Light"
    case pillGothic600mgBold = "Pill Gothic 600mg Bold"
    case pillGothic600mgSemibd = "Pill Gothic6 00mg Semibd"
    case pillGothic600mgThin = "Pill Gothic 600mg Thin"
}

struct SetFont: ViewModifier {
    let name: FontsNames
    let size: Int
    func body(content: Content) -> some View {
        content
            .font(.custom(name.rawValue, size: CGFloat(size)))
    }
}
 
extension View {
    func customFont(name: FontsNames, size: Int) -> some View {
        modifier(SetFont(name: name, size: size))
    }
}
