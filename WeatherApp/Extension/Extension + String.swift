//
//  Extension + String.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 21.05.2025.
//

import Foundation

extension String {
    func toDate(format: String = "yyyy-MM-dd HH:mm") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = .current
        formatter.locale =  Locale(identifier: "en_US_POSIX")
        return formatter.date(from: self)
    }
}
