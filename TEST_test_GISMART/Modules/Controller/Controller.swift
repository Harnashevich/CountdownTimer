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
        configureUI()
        addViews()
        addConstraints()
    }
}

//MARK: - Controller private func

extension Controller {
    
    private func createMainView() -> UIView {
        let mainView = MainView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.didTapActivateButton = {
            print("КНОПКА")
            self.showAlert()
        }
        return mainView
    }
    
    private func configureUI() {
        view.backgroundColor = .systemPink
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
    
    private func showAlert() {
        let customAlert = AlertView()
         customAlert.showAlert(with: "Great!",
                               message: "Offer acritated at ",
                               on: self)
    }
}
