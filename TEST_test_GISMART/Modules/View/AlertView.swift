//
//  AlertView.swift
//  TEST_test_GISMART
//
//  Created by Harnashevich on 3.07.22.
//

import UIKit

final class AlertView {
    
    private enum Constans {
        static let titleText = "Great!"
        static let messageText = "Offer acritated at "
        static let backgroungAltpa: CGFloat = 0.6
    }
    
    //MARK: - UI
    
    /// View for background
    private lazy var backgroundView = createBackgroundView()
    /// View for alert
    private lazy var alertView = createAlertView()
}

//MARK: - AlertView methods

extension AlertView {
    
    func showAlert(model: Countdown, on viewController: UIViewController) {
        guard let targetView = viewController.view else { return }
        backgroundView.frame = targetView.bounds
        targetView.addSubview(backgroundView)
        
        alertView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: 160.dynamicSize(),
                                 height: 80.dynamicSize())
        
        let messageLabel = createMessageLabel(with: createCorrectFormat(with: model))
        let titleLabel = createTitleLabel()
        
        targetView.addSubview(alertView)
        alertView.addSubviews(titleLabel, messageLabel)
        
        self.backgroundView.alpha = Constans.backgroungAltpa
        self.alertView.center = targetView.center
    }
    
    /// Method create format without 00 in text
    private func createCorrectFormat(with model: Countdown) -> String {
        var days = ("\(model.days):")
        var hours = ("\(model.hours):")
        var minutes = ("\(model.minutes):")
        let seconds = model.seconds
        
        if days == "00:" && hours != "00:" {
            days = String()
        } else if days == "00:" && hours == "00:" && minutes != "00:" {
            days = String()
            hours = String()
        } else if days == "00:" && hours  == "00:" && minutes == "00:" {
            days = String()
            hours = String()
            minutes = String()
        }
        return days + hours + minutes + seconds
    }
}

//MARK: - AlertView create UI elements

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
    
    private func createTitleLabel() -> UILabel {
        let label = UILabel(frame: CGRect(x: 0,
                                          y: alertView.frame.size.height / 5,
                                          width: alertView.frame.size.width,
                                          height: 25.dynamicSize()))
        label.text = Constans.titleText
        label.textColor = AppTheme.Colors.white
        label.font = AppTheme.Fonts.SFBold(30.dynamicSize())
        label.textAlignment = .center
        label.addShadow(shadowColor: AppTheme.Colors.white.cgColor,
                        shadowOffset: CGSize(width: 0, height: 0),
                        shadowOpacity: 10,
                        shadowRadius: 10)
        return label
    }
    
    private func createMessageLabel(with time: String) -> UILabel {
        let messageLabel = UILabel(frame: CGRect(x: 0,
                                                 y: alertView.frame.size.height / 1.75,
                                                 width: alertView.frame.size.width,
                                                 height: 20.dynamicSize()))
        messageLabel.text = Constans.messageText + time
        messageLabel.textColor = AppTheme.Colors.white
        messageLabel.font = AppTheme.Fonts.SFRegular(10.dynamicSize())
        messageLabel.textAlignment = .center
        return messageLabel
    }
}
