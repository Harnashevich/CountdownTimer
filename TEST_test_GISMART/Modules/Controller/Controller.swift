//
//  ViewController.swift
//  TEST_test_GISMART
//
//  Created by Harnashevich on 1.07.22.
//

import UIKit

class Controller: UIViewController {
    
    //MARK: - UI
    
    /// Main view with countdown timer and other
    private lazy var mainView = createMainView()
    /// View with custom alert
    private lazy var customAlert = AlertView()
    
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
        mainView.didTapActivateButton = { [weak self] countdown in
            guard let self = self else { return }
            self.customAlert.showAlert(model: countdown, on: self)
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
}
