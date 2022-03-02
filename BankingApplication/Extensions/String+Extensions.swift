//
//  String+Extensions.swift
//  BankingApplication
//
//  Created by Chakane Shegog on 2/28/22.
//

import Foundation

extension String {
    // returns ISO8601 Date formatter
    static func getISOFormatter() -> ISO8601DateFormatter {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.timeZone = .current
        isoDateFormatter.formatOptions = [
            .withInternetDateTime,
            .withFullDate,
            .withFullTime,
            .withFractionalSeconds,
            .withColonSeparatorInTimeZone
        ]
        return isoDateFormatter
    }
}
