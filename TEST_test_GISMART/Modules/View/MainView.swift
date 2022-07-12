//
//  MainView.swift
//  TEST_test_GISMART
//
//  Created by Harnashevich on 2.07.22.
//

import UIKit

final class MainView: UIView {
    
    private enum Constans {
        static let lastMinuteText = "LAST-MINUTE CHANCE! \n to claim your offer"
        static let saleText = "90% OFF"
        static let forFanText = "For true music fans"
        static let hundredsText = "Hundreds of songs in you pocket"
        static let privacyText = "Privacy"
        static let restoreText = "Restore"
        static let termsText = "Terms"
        static var remainingTime: Int = 60 * 60 * 24 /// Сountdown value. You can install any
        static let secondsInDay = 60 * 60 * 24 /// Variable to counting full days in countdown timer
    }
    
    //MARK: - UI
    
    /// ImageVIew "Music"
    private lazy var musicLogoImageView = createImageView()
    /// Label with days
    private lazy var daysLabel = createTimerLabel()
    /// Label with hours
    private lazy var hoursLabel = createTimerLabel()
    /// Label with minutes
    private lazy var minutesLabel = createTimerLabel()
    /// Label with seconds
    private lazy var secondsLabel = createTimerLabel()
    /// Label with colon symbol after daysLabel
    private lazy var colonAfterDaysLabel = createColonLabel()
    /// Label with colon symbol after hoursLabel
    private lazy var colonAfterHoursLabel = createColonLabel()
    /// Label with colon symbol after minutesLabel
    private lazy var colonAfterMinutesLabel = createColonLabel()
    /// Stack with countdown timer
    private lazy var timerStack = createTimerStack(spacing: 4)
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
    private lazy var bottomStack = createTimerStack(spacing: 15)
    /// Label "X" does nothing
    private lazy var xLabel = createLabel(color: AppTheme.Colors.gray, font: AppTheme.Fonts.SFRegular(10.dynamicSize()))
    /// Label for install timerStack centerXAnchor
    private lazy var fakeLabel = createColonLabel()
    
    //MARK: - Variables
    
    /// To convert from seconds to time
    private lazy var dateManager = DateFormatterManager.shared
    /// Timer for counting
    private var timer: Timer?
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNotification()
        configureUI()
        addViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Callbacks
    
    /// Button press closure
    var didTapActivateButton: ((Countdown) -> Void)?
}

//MARK: - MainView private methods

extension MainView {
    
    private func configureUI() {
        backgroundColor = AppTheme.Colors.black
        setValueToTimer()
        
        forFansLabel.text = Constans.forFanText
        saleLabel.text = Constans.saleText
        lastMinuteLabel.text = Constans.lastMinuteText
        hundredsLabel.text = Constans.hundredsText
        privacyLabel.text = Constans.privacyText
        restoreLabel.text = Constans.restoreText
        termsLabel.text = Constans.termsText
        fakeLabel.text = String()
        xLabel.text = "✕"
    }
    
    private func addViews() {
        addSubviews(musicLogoImageView, timerStack, fakeLabel, forFansLabel, saleLabel, lastMinuteLabel, hundredsLabel, activateButton, bottomStack, xLabel)
        timerStack.addArrangedSubviews(daysLabel, colonAfterDaysLabel, hoursLabel, colonAfterHoursLabel, minutesLabel, colonAfterMinutesLabel, secondsLabel)
        bottomStack.addArrangedSubviews(privacyLabel, restoreLabel, termsLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            musicLogoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            musicLogoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            musicLogoImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: setMultiplayer()),
            musicLogoImageView.widthAnchor.constraint(equalTo: musicLogoImageView.heightAnchor, multiplier: 2),
            
            timerStack.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 12),
            timerStack.centerXAnchor.constraint(equalTo: fakeLabel.centerXAnchor, constant: -16),
            
            fakeLabel.leadingAnchor.constraint(equalTo: musicLogoImageView.trailingAnchor),
            fakeLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
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
            
            xLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            xLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24)
        ])
    }
    
    private func createImageView() -> UIImageView {
        let image = UIImageView()
        image.image = AppTheme.Images.musicLogo
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
    
    private func createTimerLabel() -> UILabel {
        let label = UILabel()
        label.widthAnchor.constraint(equalToConstant: 30.dynamicSize()).isActive = true
        label.heightAnchor.constraint(equalToConstant: 17.dynamicSize()).isActive = true
        label.textColor = AppTheme.Colors.white
        label.backgroundColor = AppTheme.Colors.gray
        label.font = AppTheme.Fonts.SFBold(8.dynamicSize())
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 8
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
    
    private func createTimerStack(spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = spacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func createActivateButton() -> UIButton {
        let button = GradientButton(frame: CGRect(x: 0, y: 0, width: 0, height: 60))
        button.addShadow(shadowColor: AppTheme.Colors.pink.cgColor, shadowOffset: CGSize(width: 0, height: 0), shadowOpacity: 20, shadowRadius: 20)
        button.setTitle("ACTIVATE OFFER", for: .normal)
        button.addTarget(self, action: #selector(activateButtonTapped), for: .touchUpInside)
        button.setTitleColor(AppTheme.Colors.white, for: .normal)
        button.titleLabel?.font = AppTheme.Fonts.SFSemiBold(8.dynamicSize())
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    /// Method to multiplier sizing musicImage
    private func setMultiplayer() -> Double {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return 0.45
        default:
            return 0.35
        }
    }
    
    /// Method to stop the timer in SceneDelegate.sceneWillResignActive, and start in SceneDelegate.sceneDidBecomeActive
    private func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(didEnterBackground), name: UIScene.didActivateNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: UIScene.willDeactivateNotification, object: nil)
    }
    /// Method to check need to enable animation in timer labels
    private func chechLabelAnimation(label: UILabel, value: String) {
        if label.text != value {
            label.createTimerAnimation()
        }
    }
    
    private func setValueToTimer() {
        daysLabel.text = Int(Constans.remainingTime/Constans.secondsInDay).daysLabelFormat()
        hoursLabel.text = "\(dateManager.getTime(seconds: Constans.remainingTime).hours)"
        minutesLabel.text = "\(dateManager.getTime(seconds: Constans.remainingTime).minutes)"
        secondsLabel.text = "\(dateManager.getTime(seconds: Constans.remainingTime).seconds)"
    }
}

//MARK: - MainView @objc methods

extension MainView {
    
    @objc private func activateButtonTapped() {
        didTapActivateButton?(Countdown(days: daysLabel.text ?? String(),
                                        hours: hoursLabel.text ?? String(),
                                        minutes: minutesLabel.text ?? String(),
                                        seconds: secondsLabel.text ?? String()))
        timer?.invalidate()
        NotificationCenter.default.removeObserver(self) /// After tapped button timer removed
    }
    
    @objc private func didEnterBackground(notification: NSNotification) {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(makesStepTimer),
                                     userInfo: nil,
                                     repeats: true) /// Timer start
    }
    
    @objc private func willEnterForeground(notification: NSNotification) {
        timer?.invalidate() /// Timer stop
    }
    
    @objc private func makesStepTimer() {
        if Constans.remainingTime > 0 {
            Constans.remainingTime -= 1
        } else {
            timer?.invalidate()
            Constans.remainingTime = 0
        }
       
        chechLabelAnimation(label: secondsLabel, value: dateManager.getTime(seconds: Constans.remainingTime).seconds)
        chechLabelAnimation(label: minutesLabel, value: dateManager.getTime(seconds: Constans.remainingTime).minutes)
        chechLabelAnimation(label: hoursLabel, value: dateManager.getTime(seconds: Constans.remainingTime).hours)
        chechLabelAnimation(label: daysLabel, value: Int(Constans.remainingTime/Constans.secondsInDay).daysLabelFormat())
        
        setValueToTimer()
    }
}
