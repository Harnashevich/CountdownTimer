//
//  DateFormatterManager.swift
//  TEST_test_GISMART
//
//  Created by Harnashevich on 4.07.22.
//

import Foundation

final class DateFormatterManager {
    
    static let shared = DateFormatterManager()
    
    private let formatter = DateFormatter()
    private let currentSecondsFromGMT = TimeZone.current.secondsFromGMT()
    
    private init() {}
    
    private func configureFormatter(formatter: DateFormatter, format: String) {
        formatter.dateFormat = format
        formatter.timeZone = .current
    }
    /// Cteate from seconds to Countdown Model
    func getTime(seconds: Int) -> Countdown {
        var hour = String()
        var minutes = String()
        var second = String()
        
        let currentTime = Double(seconds  - currentSecondsFromGMT)
        
        self.configureFormatter(formatter: self.formatter, format: "HH")
        let hoursInSeconds = Date(timeIntervalSince1970: currentTime)
        hour = formatter.string(from: hoursInSeconds)
        
        self.configureFormatter(formatter: self.formatter, format: "mm")
        let minitesInSeconds = Date(timeIntervalSince1970: currentTime)
        minutes = formatter.string(from: minitesInSeconds)
        
        self.configureFormatter(formatter: self.formatter, format: "ss")
        let secondsInSeconds = Date(timeIntervalSince1970: currentTime)
        second = formatter.string(from: secondsInSeconds)
        
        return Countdown(days: String(), hour: hour, minutes: minutes, seconds: second)
    }
}
