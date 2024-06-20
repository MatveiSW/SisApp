//
//  CodeSuccessView.swift
//  SisApp
//
//  Created by Матвей Авдеев on 20.06.2024.
//

import UIKit

class CodeSuccessView: UIView {
    
    private let coefHeight = UIScreen.main.bounds.height.adjustSizeHeight()
    private let coefWidth = UIScreen.main.bounds.width.adjustSizeWidth()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor(named: "passwordContainerColor")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var successLabel: UILabel = {
        let label = UILabel()
        label.text = "Вы успешно создали код\nприложения"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти в приложение", for: .normal)
        button.setTitleColor(UIColor(named: "registerButtonBackground"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(named: "passwordContainerColor")
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(views: containerView, signInButton)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(views: UIView...) {
        views.forEach({
            addSubview($0)
        })
        containerView.addSubview(successLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
                containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30 * coefWidth),
                containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30 * coefWidth),
                containerView.heightAnchor.constraint(equalToConstant: 118 * coefHeight),
                
                successLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
                successLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                
                signInButton.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 24),
                signInButton.widthAnchor.constraint(equalTo: containerView.widthAnchor),
                signInButton.heightAnchor.constraint(equalToConstant: 65 * coefHeight),
                signInButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            ]
        )
    }
    
}
