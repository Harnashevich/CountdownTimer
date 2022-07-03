//
//  ActualGradientButton.swift
//  TEST_test_GISMART
//
//  Created by Harnashevich on 2.07.22.
//

import UIKit

final class ActualGradientButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let lay = CAGradientLayer()
        lay.frame = self.bounds
        lay.colors = [AppTheme.Colors.pink.cgColor, AppTheme.Colors.lightBlue.cgColor]
        lay.startPoint = CGPoint(x: 0, y: 1)
        lay.endPoint = CGPoint(x: 0, y: 0)
        lay.cornerRadius = 12
        layer.insertSublayer(lay, at: 0)
        return lay
    }()
}
