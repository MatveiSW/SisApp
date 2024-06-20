//
//  RegisterButton.swift
//  SisApp
//
//  Created by Матвей Авдеев on 18.06.2024.
//

import UIKit

class RegisterButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitleColor(.white, for: .normal)
        self.setBackgroundImage(UIImage(named: "buttonBackground"), for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 17)
    }
    
}

