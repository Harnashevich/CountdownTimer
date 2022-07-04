//
//  Int + Extension.swift
//  TEST_test_GISMART
//
//  Created by Harnashevich on 4.07.22.
//

import Foundation

extension Int {
    /// Create format from 1 to 01
    func daysLabelFormat() -> String {
        String(format: "%02d", self)
    }
}
