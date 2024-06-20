//
//  SignInPhoneView.swift
//  SisApp
//
//  Created by Матвей Авдеев on 19.06.2024.
//

import UIKit

class SignInPhoneView: UIView {
    
    weak var delegate: SignInPhoneViewButtonDelegate?
    
    private let coefHeight = UIScreen.main.bounds.height.adjustSizeHeight()
    private let coefWidth = UIScreen.main.bounds.width.adjustSizeWidth()
    
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
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(named: "phoneTextFieldColor")?.cgColor
        view.backgroundColor = .clear
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "+7"
        label.textColor = .white
        return label
    }()
    
    private lazy var numberImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "maskTextFieldImage")
        return image
    }()
    
    private lazy var numberStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [numberLabel, numberImageView])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    public lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "phoneTextFieldColor")?.cgColor
        textField.backgroundColor = .clear
        textField.layer.cornerRadius = 10
        textField.textAlignment = .center
        textField.textColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 13)
        label.text = "Номер телефона"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var codeLabel: UILabel = {
        let label = UILabel()
        label.text = "Код придет на ваш номер телефона"
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public lazy var getCodeButton: RegisterButton = {
        let button = RegisterButton()
        button.setTitle("Получить код", for: .normal)
        button.isEnabled = false
        button.addTarget(self, action: #selector(getCodeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(views: backButton, headerLabel, containerView, phoneTextField, phoneLabel, codeLabel, getCodeButton)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(views: UIView...) {
        views.forEach({
            addSubview($0)
        })
        
        containerView.addSubview(numberStackView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                backButton.topAnchor.constraint(equalTo: topAnchor, constant: 72 * coefHeight),
                backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 34 * coefWidth),
                
                headerLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
                headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                containerView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 63 * coefHeight),
                containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 34 * coefWidth),
                containerView.heightAnchor.constraint(equalToConstant: 50 * coefHeight),
                containerView.widthAnchor.constraint(equalToConstant: 70 * coefWidth),
                
                numberStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10 * coefHeight),
                numberStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 13 * coefWidth),
                numberStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -13 * coefWidth),
                numberStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10 * coefWidth),
                
                phoneTextField.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
                phoneTextField.heightAnchor.constraint(equalTo: containerView.heightAnchor),
                phoneTextField.leadingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 18 * coefWidth),
                phoneTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -34 * coefWidth),
                
                phoneLabel.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: -15 * coefHeight),
                phoneLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 34 * coefWidth),
                
                codeLabel.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 22 * coefHeight),
                codeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                getCodeButton.topAnchor.constraint(equalTo: codeLabel.bottomAnchor, constant: 53 * coefHeight),
                getCodeButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            ]
        )
    }
    
    @objc private func backButtonTapped() {
        delegate?.backButtonTapped()
    }
    
    @objc private func getCodeButtonTapped() {
        delegate?.getCodeButtonTapped()
    }
}
