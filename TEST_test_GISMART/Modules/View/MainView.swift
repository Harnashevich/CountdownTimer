//
//  View.swift
//  TEST_test_GISMART
//
//  Created by Harnashevich on 2.07.22.
//

import UIKit

final class MainView: UIView {
    
//    private enum Constants {
//        static var multiplyDepentScteen: Double = 0.3
//    }
    
    //MARK: - UI
    
    /// ImageVIew "Music"
    private lazy var musicLogoImageView = createImageView()
    
    /// Label with days
    private lazy var daysLabel = createTimerLabel(color: AppTheme.Colors.white, font: AppTheme.Fonts.SFBold(10.dynamicSize()))
    /// Label with hours
    private lazy var hoursLabel = createTimerLabel(color: AppTheme.Colors.white, font: AppTheme.Fonts.SFBold(10.dynamicSize()))
    /// Label with minutes
    private lazy var minutesLabel = createTimerLabel(color: AppTheme.Colors.white, font: AppTheme.Fonts.SFBold(10.dynamicSize()))
    /// Label with seconds
    private lazy var secondsLabel = createTimerLabel(color: AppTheme.Colors.white, font: AppTheme.Fonts.SFBold(10.dynamicSize()))
    /// Label with colon symbol after daysLabel
    private lazy var colonAfterDaysLabel = createColonLabel()
    /// Label with colon symbol after hoursLabel
    private lazy var colonAfterHoursLabel = createColonLabel()
    /// Label with colon symbol after minutesLabel
    private lazy var colonAfterMinutesLabel = createColonLabel()
    
    /// Stack with countdown Timer
    private lazy var timerStack = createTimerStack()
    /// Label "For true music fans"
    private lazy var forFansLabel = createLabel(color: AppTheme.Colors.white, font: AppTheme.Fonts.SFSemiBold(5.dynamicSize()))
    /// Label "90% OFF"
    private lazy var saleLabel = createLabel(color: AppTheme.Colors.white, font: AppTheme.Fonts.SFHeavy(25.dynamicSize()))
    /// Label "LAST-MINUTE..."
    private lazy var lastMinuteLabel = createLabel(color: AppTheme.Colors.white, font: AppTheme.Fonts.SFSemiBold(10.dynamicSize()))
    /// Label "Hundreds of songs in you pocket"
    private lazy var hundredsLabel = createLabel(color: AppTheme.Colors.lightGray, font: AppTheme.Fonts.SFRegular(6.dynamicSize()))
    /// Button activate offer
    private lazy var activateButton = createActivateButton()
    /// Label "Privacy"
    private lazy var privacyLabel = createLabel(color: AppTheme.Colors.lightGray, font: AppTheme.Fonts.SFRegular(4.dynamicSize()))
    /// Label "Restore"
    private lazy var restoreLabel = createLabel(color: AppTheme.Colors.lightGray, font: AppTheme.Fonts.SFRegular(4.dynamicSize()))
    /// Label "Terms"
    private lazy var termsLabel = createLabel(color: AppTheme.Colors.lightGray, font: AppTheme.Fonts.SFRegular(4.dynamicSize()))
    /// Stack with labels "Privacy", Restore", "Terms"
    private lazy var bottomStack = createTimerStack()
    
    
    
    private lazy var testLabel = createColonLabel()
    
    var count = 0
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        addViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Callbacks
    
    /// Колбек нажатия кнопки "Зарегистрироваться"
    var didTapActivateButton: (() -> Void)?
}

//MARK: - MainView private func

extension MainView {
        
    private func configureUI() {
        backgroundColor = AppTheme.Colors.black
        
        daysLabel.text = "00"
        hoursLabel.text = "01"
        minutesLabel.text = "02"
        secondsLabel.text = "03"
        
        testLabel.text = ""
        
        forFansLabel.text = "For true music fans"
        saleLabel.text = "90% OFF"
        lastMinuteLabel.text = "LAST-MINUTE CHANCE! \n to claim your offer"
        hundredsLabel.text = "Hundreds of songs in you pocket"
        
        privacyLabel.text = "Privacy"
        restoreLabel.text = "Restore"
        termsLabel.text = "Terms"
    }
    
    private func addViews() {
        addSubviews(musicLogoImageView, timerStack, testLabel, forFansLabel, saleLabel, lastMinuteLabel, hundredsLabel, activateButton, bottomStack)
        timerStack.addArrangedSubviews(daysLabel, colonAfterDaysLabel, hoursLabel, colonAfterHoursLabel, minutesLabel, colonAfterMinutesLabel, secondsLabel)
        bottomStack.addArrangedSubviews(privacyLabel, restoreLabel, termsLabel)
    }
    
            private func addConstraints() {
                NSLayoutConstraint.activate([
                    musicLogoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
                    musicLogoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                    musicLogoImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: checkDevice()),
                    musicLogoImageView.widthAnchor.constraint(equalTo: musicLogoImageView.heightAnchor, multiplier: 2),
                    
                    timerStack.centerYAnchor.constraint(equalTo: centerYAnchor),
                    timerStack.centerXAnchor.constraint(equalTo: testLabel.centerXAnchor),
                    
                    testLabel.leadingAnchor.constraint(equalTo: musicLogoImageView.trailingAnchor),
                    testLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                    
                    forFansLabel.centerXAnchor.constraint(equalTo: timerStack.centerXAnchor),
                    forFansLabel.bottomAnchor.constraint(equalTo: timerStack.topAnchor, constant: -20),
                    
                    saleLabel.centerXAnchor.constraint(equalTo: timerStack.centerXAnchor),
                    saleLabel.bottomAnchor.constraint(equalTo: forFansLabel.topAnchor, constant: -8),
                    
                    lastMinuteLabel.centerXAnchor.constraint(equalTo: timerStack.centerXAnchor),
                    lastMinuteLabel.bottomAnchor.constraint(equalTo: saleLabel.topAnchor, constant: -12),
                    
                    hundredsLabel.centerXAnchor.constraint(equalTo: timerStack.centerXAnchor),
                    hundredsLabel.topAnchor.constraint(equalTo: timerStack.bottomAnchor, constant: 16),
                    
                    activateButton.heightAnchor.constraint(equalToConstant: 30.dynamicSize()),
                    activateButton.widthAnchor.constraint(equalTo: timerStack.widthAnchor, multiplier: 1),
                    activateButton.centerXAnchor.constraint(equalTo: timerStack.centerXAnchor),
                    activateButton.topAnchor.constraint(equalTo: hundredsLabel.bottomAnchor, constant: 15),
                    
                    bottomStack.centerXAnchor.constraint(equalTo: timerStack.centerXAnchor),
                    bottomStack.topAnchor.constraint(equalTo: activateButton.bottomAnchor, constant: 20),
        ])
    }
    
    private func checkDevice() -> Double {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            print("ЭТО АЙФОН")
            return 0.5
        case .pad:
            print("ЭТО АЙПЭД")
            return 0.4
        @unknown default:
            print("ЭТО другое")
            return 0.5
        }
    }
    
    private func createImageView() -> UIImageView {
        let image = UIImageView()
        image.image = AppTheme.Images.musicLogo
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
    
    private func createTimerLabel(color: UIColor, font: UIFont) -> UILabel {
        let label = UILabel()
        label.widthAnchor.constraint(equalToConstant: 25.dynamicSize()).isActive = true
        label.heightAnchor.constraint(equalToConstant: 20.dynamicSize()).isActive = true
        label.textColor = color
        label.font = font
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.backgroundColor = AppTheme.Colors.gray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func createColonLabel() -> UILabel {
        let label = UILabel()
        label.textColor = AppTheme.Colors.white
        label.font = AppTheme.Fonts.SFBold(10.dynamicSize())
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ":"
        return label
    }
    
    private func createLabel(color: UIColor, font: UIFont) -> UILabel {
        let label = UILabel()
        label.textColor = color
        label.font = font
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func createTimerStack() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 6
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func createActivateButton() -> UIButton {
        let button = ActualGradientButton()
        button.addShadow(shadowColor: AppTheme.Colors.pink.cgColor, shadowOffset: CGSize(width: 0, height: 0), shadowOpacity: 20, shadowRadius: 20)
        button.setTitle("ACTIVATE OFFER", for: .normal)
        button.addTarget(self, action: #selector(activateButtonTapped), for: .touchUpInside)
        button.setTitleColor(AppTheme.Colors.white, for: .normal)
        button.titleLabel?.font = AppTheme.Fonts.SFSemiBold(8.dynamicSize())
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    @objc func activateButtonTapped() {
        didTapActivateButton?()
    }
    
   
}
