//
//  Double + Extension.swift
//  TEST_test_GISMART
//
//  Created by Harnashevich on 2.07.22.
//

import UIKit

extension Double {
    /// Create dynamic size to fonts depending on screen size
    func dynamicSize() -> CGFloat {
        let screenWidth = UIScreen.main.bounds.size.width
        let calculatedFontSize = screenWidth / 375 * self
        return calculatedFontSize
    }
}
