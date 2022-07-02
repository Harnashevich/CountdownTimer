//
//  AlertView.swift
//  TEST_test_GISMART
//
//  Created by Harnashevich on 3.07.22.
//

import UIKit

final class AlertView {
    
    struct Constans {
        static let backgroungAltpaTo: CGFloat = 0.6
    }
    
    private let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = AppTheme.Colors.black
        backgroundView.alpha = 0
        return backgroundView
    }()
    
    private let alertView: UIView = {
        let alert = UIView()
        alert.layer.masksToBounds = true
        alert.layer.cornerRadius = 12
        alert.backgroundColor = AppTheme.Colors.darkBlue
        return alert
    }()
    
     func showAlert(with title: String,
                    message: String,
                    on viewController: UIViewController) {
         guard let targetView = viewController.view else { return }
         backgroundView.frame = targetView.bounds
         targetView.addSubview(backgroundView)
         alertView.frame = CGRect(x: 0,
                                  y: 0,
                                  width: 300,
                                  height: 150)
         
         targetView.addSubview(alertView)
         
         let titleLabel = UILabel(frame: CGRect(x: 0,
                                                y: 20,
                                                width: alertView.frame.size.width,
                                                height: 80))
         titleLabel.text = title
         titleLabel.textColor = AppTheme.Colors.white
         titleLabel.font = AppTheme.Fonts.SFBold(30)
         titleLabel.textAlignment = .center
         titleLabel.addShadow(shadowColor: AppTheme.Colors.white.cgColor, shadowOffset: CGSize(width: 0, height: 0), shadowOpacity: 10, shadowRadius: 10)
         alertView.addSubview(titleLabel)
         
         let messageLabel = UILabel(frame: CGRect(x: 0,
                                                  y: 50,
                                                  width: alertView.frame.size.width,
                                                  height: 100))
         messageLabel.text = message
         messageLabel.textColor = AppTheme.Colors.white
         messageLabel.textAlignment = .center
         alertView.addSubview(messageLabel)
         
         self.backgroundView.alpha = Constans.backgroungAltpaTo
         
         self.alertView.center = targetView.center
         
     }
}
