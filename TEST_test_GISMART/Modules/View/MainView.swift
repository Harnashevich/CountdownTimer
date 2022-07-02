//
//  View.swift
//  TEST_test_GISMART
//
//  Created by Harnashevich on 2.07.22.
//

import UIKit

final class MainView: UIView {
    
    //MARK: - UI
    
    private lazy var musicLogoImageView = createImageView()
    
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainView {
    
    private func createImageView() -> UIImageView {
        let image = UIImageView()
        image.image = AppTheme.Images.musicLogo
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }
    
    private func configureUI() {
    
        backgroundColor = .black
        
    
        addSubviews(musicLogoImageView)
        
        NSLayoutConstraint.activate([
            
            musicLogoImageView.topAnchor.constraint(equalTo: topAnchor),
            musicLogoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            
            
        ])

    }
}
    


