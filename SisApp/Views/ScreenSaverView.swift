//
//  SignInView.swift
//  SisApp
//
//  Created by Матвей Авдеев on 18.06.2024.
//

import UIKit

class ScreenSaverView: UIView {
    
    weak var delegate: ScreenSaverViewButtonDelegate?
    
    private let coefHeight = UIScreen.main.bounds.height.adjustSizeHeight()
    private let coefWidth = UIScreen.main.bounds.width.adjustSizeWidth()
    
    private lazy var sisImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "sisImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var sisLabel: UILabel = {
        let label = UILabel()
        label.text = "SIS"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var securityLabel: UILabel = {
        let label = UILabel()
        label.text = "Выбери свою безопасность"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var signInButton: RegisterButton = {
        let button = RegisterButton()
        button.setTitle("Войти по номеру телефона", for: .normal)
        button.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var accountLabel: UILabel = {
        let label = UILabel()
        label.text = "У вас нет аккаунта?"
        label.textColor = .white
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Зарегестрируйтесь сейчас", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        let attributedString = NSAttributedString(
            string: "Зарегестрируйтесь сейчас",
            attributes: [
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .font: UIFont.systemFont(ofSize: 15),
                .foregroundColor: UIColor(named: "registerButtonBackground") ?? ""
            ]
        )
        button.setAttributedTitle(attributedString, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(views: sisImageView, sisLabel, securityLabel, signInButton, accountLabel, registerButton)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                sisImageView.topAnchor.constraint(equalTo: topAnchor, constant: 265 * coefHeight),
                sisImageView.widthAnchor.constraint(equalToConstant: 79 * coefWidth),
                sisImageView.heightAnchor.constraint(equalToConstant: 79 * coefHeight),
                sisImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                sisLabel.topAnchor.constraint(equalTo: sisImageView.bottomAnchor, constant: 31 * coefHeight),
                sisLabel.centerXAnchor.constraint(equalTo: sisImageView.centerXAnchor),
                
                securityLabel.topAnchor.constraint(equalTo: sisLabel.bottomAnchor, constant: 18 * coefHeight),
                securityLabel.centerXAnchor.constraint(equalTo: sisImageView.centerXAnchor),
                
                signInButton.topAnchor.constraint(equalTo: securityLabel.bottomAnchor, constant: 100 * coefHeight),
                signInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35 * coefWidth),
                signInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35 * coefWidth),
                
                accountLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 100 * coefHeight),
                accountLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                registerButton.topAnchor.constraint(equalTo: accountLabel.bottomAnchor),
                registerButton.centerXAnchor.constraint(equalTo: accountLabel.centerXAnchor)
                
            ]
        )
    }
    
    @objc private func signInButtonTapped() {
        delegate?.signInButton()
    }
    
    @objc private func registerButtonTapped() {
        delegate?.registerButton()
    }
}

