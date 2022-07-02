//
//  ViewController.swift
//  TEST_test_GISMART
//
//  Created by Harnashevich on 1.07.22.
//

import UIKit

class Controller: UIViewController {
    
    //MARK: - UI
    
    private lazy var form:  MainView = {
        let form = MainView()
        form.translatesAutoresizingMaskIntoConstraints = false
        return form
    }()

    private func addViews() {
        
    }

    private func addConstraints() {
        
    }
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

//MARK: - ViewController private func

extension Controller {
    
    
    private func configureUI() {
        view.addSubview(form)
       
        view.backgroundColor = .systemPink
        NSLayoutConstraint.activate([
            form.topAnchor.constraint(equalTo: view.topAnchor),
            form.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            form.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            form.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

