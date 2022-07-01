//
//  ViewController.swift
//  TEST_test_GISMART
//
//  Created by Harnashevich on 1.07.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
           label.center = CGPoint(x: 100, y: 0)
           label.textAlignment = .center
           label.text = "I'm a test label"

           self.view.addSubview(label)
    }
    
    


}

