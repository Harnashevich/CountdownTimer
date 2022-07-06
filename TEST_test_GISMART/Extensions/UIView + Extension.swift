//
//  UIView + Extension.swift
//  TEST_test_GISMART
//
//  Created by Harnashevich on 2.07.22.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
    
    func addShadow(shadowColor: CGColor,
                   shadowOffset: CGSize,
                   shadowOpacity: Float,
                   shadowRadius: CGFloat) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = false
    }
    
    func createTimerAnimation() {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.reveal
        animation.duration = 0.15
        animation.subtype = .fromBottom
        layer.add(animation, forKey: CATransitionType.reveal.rawValue)
    }
}
