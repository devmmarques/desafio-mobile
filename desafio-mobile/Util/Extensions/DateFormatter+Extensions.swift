//
//  DateFormatter+Extensions.swift
//  desafio-mobile
//
//  Created by Marco Marques on 23/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static let defaultAPIDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0) // a API já vem em GMT-3
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
}
