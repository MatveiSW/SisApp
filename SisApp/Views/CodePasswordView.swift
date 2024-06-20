//
//  CodePasswordView.swift
//  SisApp
//
//  Created by Матвей Авдеев on 20.06.2024.
//

import UIKit

class CodePasswordView: UIView {
    
    weak var delegate: CodePasswordViewButtonDelegate?
    
    var codeCircles = [UIView]()
    
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
        label.text = "Код приложения"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var makeCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "Создайте код приложения"
        label.font = .systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sendCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите код из символов"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.backgroundColor = UIColor(named: "passwordContainerColor")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var circlesStackView: UIStackView = {
        var circles = [UIView]()
        for _ in 0..<4 {
            let circle = UIView()
            circle.translatesAutoresizingMaskIntoConstraints = false
            circle.heightAnchor.constraint(equalToConstant: 10 * coefHeight).isActive = true
            circle.widthAnchor.constraint(equalToConstant: 10 * coefWidth).isActive = true
            circle.layer.cornerRadius = 5
            circle.backgroundColor = .lightGray
            codeCircles.append(circle)
            circles.append(circle)
        }
        let stack = UIStackView(arrangedSubviews: circles)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.spacing = 30
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    public lazy var codeTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .numberPad
        textField.isHidden = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(views: backButton, headerLabel, makeCodeLabel, sendCodeLabel, containerView, codeTextField)
        setupLayout()
        codeTextField.becomeFirstResponder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(views: UIView...) {
        views.forEach({
            addSubview($0)
        })
        containerView.addSubview(circlesStackView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                backButton.topAnchor.constraint(equalTo: topAnchor, constant: 72 * coefHeight),
                backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 34 * coefWidth),
                
                headerLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
                headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                makeCodeLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 75 * coefHeight),
                makeCodeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                sendCodeLabel.topAnchor.constraint(equalTo: makeCodeLabel.bottomAnchor, constant: 47 * coefHeight),
                sendCodeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                containerView.topAnchor.constraint(equalTo: sendCodeLabel.bottomAnchor, constant: 36 * coefHeight),
                containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
                containerView.widthAnchor.constraint(equalToConstant: 180 * coefWidth),
                containerView.heightAnchor.constraint(equalToConstant: 52 * coefHeight),
                
                circlesStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20 * coefHeight),
                circlesStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25 * coefWidth),
                circlesStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -25 * coefWidth),
                circlesStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20 * coefHeight)
            ]
        )
    }
    
    @objc private func backButtonTapped() {
        delegate?.backButtonTapped()
    }
    
}
