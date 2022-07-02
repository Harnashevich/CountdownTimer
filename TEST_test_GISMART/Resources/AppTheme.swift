//
//  AppTheme.swift
//  TEST_test_GISMART
//
//  Created by Harnashevich on 2.07.22.
//

import UIKit

enum AppTheme {
    
    enum Colors {
        static let black = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        static let darkBlue = UIColor(red: 0/250, green: 0/250, blue: 80/250, alpha: 1.0)
        static let lightBlue = UIColor(red: 65/250, green: 69/250, blue: 152/250, alpha: 1.0)
        static let pink = UIColor(red: 234/250, green: 72/250, blue: 187/250, alpha: 1.0)
        static let gray = UIColor(red: 86/250, green: 86/250, blue: 86/250, alpha: 1.0)
        static let lightGray = UIColor(red: 190/250, green: 190/250, blue: 190/250, alpha: 1.0)
        static let white = UIColor(red: 250/250, green: 250/250, blue: 250/250, alpha: 1.0)
        
    }
    
    enum Fonts {
        static func SFHeavy(_ size: CGFloat) -> UIFont {
            return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.heavy)
        }
        
        static func SFBold(_ size: CGFloat) -> UIFont {
            return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.bold)
        }
        
        static func SFSemiBold(_ size: CGFloat) -> UIFont {
            return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.semibold)
        }
        
        static func SFMedium(_ size: CGFloat) -> UIFont {
            return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.medium)
        }
        
        static func SFRegular(_ size: CGFloat) -> UIFont {
            return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.regular)
        }
        
        static func SFLight(_ size: CGFloat) -> UIFont {
            return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.light)
        }
    }
    
    enum Images {
        static let musicLogo = UIImage(named: "musicLogo")
    }
}
