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
        let currentTime = Double(seconds  - currentSecondsFromGMT)
        
        self.configureFormatter(formatter: self.formatter, format: "HHmmss")
        let hoursInSeconds = Date(timeIntervalSince1970: currentTime)
        let time = formatter.string(from: hoursInSeconds)
        
        let hour = time[0 ..< 2]
        let minutes = time[2 ..< 4]
        let seconds = time[4 ..< 6]
        
        return Countdown(days: String(), hours: hour, minutes: minutes, seconds: seconds)
    }
}
