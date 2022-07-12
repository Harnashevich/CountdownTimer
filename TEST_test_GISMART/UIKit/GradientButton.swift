//
//  ActualGradientButton.swift
//  TEST_test_GISMART
//
//  Created by Harnashevich on 2.07.22.
//

import UIKit

final class GradientButton: UIButton {
    
    private enum Constans {
        static let firstColor: CGColor = AppTheme.Colors.pink.cgColor
        static let secondColor: CGColor = AppTheme.Colors.lightBlue.cgColor
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let lay = CAGradientLayer()
        lay.frame = self.bounds
        lay.colors = [Constans.firstColor, Constans.secondColor]
        lay.startPoint = CGPoint(x: 0, y: 1)
        lay.endPoint = CGPoint(x: 0, y: 0)
        lay.cornerRadius = 12
        layer.insertSublayer(lay, at: 0)
        return lay
    }()
}
