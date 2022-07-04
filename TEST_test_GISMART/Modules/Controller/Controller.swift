//
//  ViewController.swift
//  TEST_test_GISMART
//
//  Created by Harnashevich on 1.07.22.
//

import UIKit

class Controller: UIViewController {
    
    //MARK: - UI
    
    private lazy var mainView = createMainView()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        addConstraints()
    }
}

//MARK: - Controller private func

extension Controller {
    
    private func createMainView() -> UIView {
        let mainView = MainView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.didTapActivateButton = { [weak self] days, hours, minutes, seconds in
            guard let self = self else { return }
            var days = ("\(days):")
            var hours = ("\(hours):")
            var minutes = ("\(minutes):")
            
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
            self.showAlert(time: days + hours + minutes + seconds)
        }
        return mainView
    }
    
    private func addViews() {
        view.addSubview(mainView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func showAlert(time: String) {
        let customAlert = AlertView()
         customAlert.showAlert(with: "Great!",
                               message: "Offer acritated at " + time,
                               on: self)
    }
}
