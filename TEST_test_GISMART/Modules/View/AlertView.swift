//
//  AlertView.swift
//  TEST_test_GISMART
//
//  Created by Harnashevich on 3.07.22.
//

import UIKit

final class AlertView {
    
    struct Constans {
        static let backgroungAltpa: CGFloat = 0.6
    }
    
    //MARK: - UI
    
    /// View for background
    private lazy var backgroundView = createBackgroundView()
    /// VIew for alert
    private lazy var alertView = createAlertView()
}

//MARK: - AlertView private methods

extension AlertView {
    
    private func createBackgroundView() -> UIView {
        let backgroundView = UIView()
        backgroundView.backgroundColor = AppTheme.Colors.black
        backgroundView.alpha = 0
        return backgroundView
    }
    
    private func createAlertView() -> UIView {
        let alert = UIView()
        alert.layer.masksToBounds = true
        alert.layer.cornerRadius = 12
        alert.backgroundColor = AppTheme.Colors.darkBlue
        return alert
    }
}

//MARK: - AlertView methods

extension AlertView {
    
    func showAlert(with title: String,
                   message: String,
                   on viewController: UIViewController) {
        guard let targetView = viewController.view else { return }
        backgroundView.frame = targetView.bounds
        targetView.addSubview(backgroundView)
        
        alertView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: 180.dynamicSize(),
                                 height: 90.dynamicSize())
        
        targetView.addSubview(alertView)
        
        let titleLabel = UILabel(frame: CGRect(x: 0,
                                               y: alertView.frame.size.height / 5,
                                               width: alertView.frame.size.width,
                                               height: 25.dynamicSize()))
        titleLabel.text = title
        titleLabel.textColor = AppTheme.Colors.white
        titleLabel.font = AppTheme.Fonts.SFBold(30.dynamicSize())
        titleLabel.textAlignment = .center
        titleLabel.addShadow(shadowColor: AppTheme.Colors.white.cgColor, shadowOffset: CGSize(width: 0, height: 0), shadowOpacity: 10, shadowRadius: 10)
        alertView.addSubview(titleLabel)
        
        let messageLabel = UILabel(frame: CGRect(x: 0,
                                                 y: alertView.frame.size.height / 1.75,
                                                 width: alertView.frame.size.width,
                                                 height: 20.dynamicSize()))
        messageLabel.text = message
        messageLabel.textColor = AppTheme.Colors.white
        messageLabel.font = AppTheme.Fonts.SFRegular(10.dynamicSize())
        messageLabel.textAlignment = .center
        alertView.addSubview(messageLabel)
        
        self.backgroundView.alpha = Constans.backgroungAltpa
        self.alertView.center = targetView.center
        
    }
}
