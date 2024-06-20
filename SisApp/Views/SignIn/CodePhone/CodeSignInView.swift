//
//  CodeSignInView.swift
//  SisApp
//
//  Created by Матвей Авдеев on 19.06.2024.
//

import UIKit

class CodeSignInView: UIView {
    
    weak var delegate: CodeSignInViewButtonDelegate?
    
    private let coefHeight = UIScreen.main.bounds.height.adjustSizeHeight()
    private let coefWidth = UIScreen.main.bounds.width.adjustSizeWidth()
    
    public var textFields: [UITextField] = []
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backButtonImage"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Войти"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var verifyLabel: UILabel = {
        let label = UILabel()
        label.text = "Верификация"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var codeLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите код из смс,\nчто мы отправили вам"
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .lightGray
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sendCodeAgainLabel: UILabel = {
        let label = UILabel()
        label.text = "Отправить код можно\nчерез 5:00 минут"
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var codeTextFieldStackView: UIStackView = {
            var fields = [UITextField]()
            for _ in 0..<6 {
                let textField = UITextField()
                textField.backgroundColor = .white
                textField.textAlignment = .center
                textField.font = .systemFont(ofSize: 20)
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.layer.cornerRadius = 8
                textField.layer.borderWidth = 1
                textField.layer.borderColor = UIColor(named: "phoneTextFieldColor")?.cgColor
                textField.keyboardType = .numberPad
                textField.textColor = .white
                textField.backgroundColor = .clear
                textFields.append(textField)
                fields.append(textField)
            }
            let stack = UIStackView(arrangedSubviews: fields)
            stack.axis = .horizontal
            stack.alignment = .fill
            stack.distribution = .fillEqually
            stack.spacing = 7.7 * coefWidth
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
    
    public lazy var registerButton: RegisterButton = {
        let button = RegisterButton()
        button.setTitle("Зарегистрироваться", for: .normal)
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    private lazy var dontGetCodeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Не получил код!", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        let attributedString = NSAttributedString(
            string: "Не получил код!",
            attributes: [
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .font: UIFont.systemFont(ofSize: 15),
                .foregroundColor: UIColor.white
            ]
        )
        button.setAttributedTitle(attributedString, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(views: backButton, headerLabel, verifyLabel, codeLabel, sendCodeAgainLabel, codeTextFieldStackView, registerButton, dontGetCodeButton)
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
                backButton.topAnchor.constraint(equalTo: topAnchor, constant: 72 * coefHeight),
                backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 34 * coefWidth),
                
                headerLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
                headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                verifyLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 67 * coefHeight),
                verifyLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                codeLabel.topAnchor.constraint(equalTo: verifyLabel.bottomAnchor, constant: 18 * coefHeight),
                codeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                sendCodeAgainLabel.topAnchor.constraint(equalTo: codeLabel.bottomAnchor, constant: 35 * coefHeight),
                sendCodeAgainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                codeTextFieldStackView.topAnchor.constraint(equalTo: sendCodeAgainLabel.bottomAnchor, constant: 50 * coefHeight),
                codeTextFieldStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 37 * coefWidth),
                codeTextFieldStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -37 * coefWidth),
                codeTextFieldStackView.heightAnchor.constraint(equalToConstant: 46 * coefHeight),
                
                registerButton.topAnchor.constraint(equalTo: codeTextFieldStackView.bottomAnchor, constant: 28 * coefHeight),
                registerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                dontGetCodeButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 23 * coefHeight),
                dontGetCodeButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            ]
        )
    }
    
    @objc private func backButtonTapped() {
        delegate?.backButtonTapped()
    }
    
    @objc func registerButtonTapped() {
        delegate?.registerButtonTapped()
    }
}
