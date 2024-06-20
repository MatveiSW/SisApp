//
//  CodeSignInViewController.swift
//  SisApp
//
//  Created by Матвей Авдеев on 19.06.2024.
//

import UIKit

class CodeSignInViewController: UIViewController {
    
    private lazy var mainView = CodeSignInView()
    private var activeTextFieldIndex: Int = 0
    private lazy var enteredCode: String = ""
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        mainView.delegate = self
        mainView.textFields.forEach({
            $0.delegate = self
        })
    }
    
    private func setActiveTextField(at index: Int) {
        if index < mainView.textFields.count {
            activeTextFieldIndex = index
            mainView.textFields[activeTextFieldIndex].becomeFirstResponder()
        }
    }

    
}

extension CodeSignInViewController: CodeSignInViewButtonDelegate {
    func registerButtonTapped() {
        dismiss(animated: true) {
            Container.shared.router.presentMainViewController()
        }
    }
    
    func backButtonTapped() {
        dismiss(animated: true) {
            Container.shared.router.presentSignInPhoneViewController()
        }
    }
}

extension CodeSignInViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentIndex = mainView.textFields.firstIndex(of: textField) else { return false }
        let currentText = textField.text ?? ""
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
        let maxLength = 1
        
        if newText.count <= maxLength {
            textField.text = newText
            if !string.isEmpty {
                enteredCode += newText
                if newText.count == maxLength {
                    if currentIndex < mainView.textFields.count - 1 {
                        setActiveTextField(at: currentIndex + 1)
                    } else {
                        textField.resignFirstResponder()
                        mainView.registerButton.isEnabled = true
                    }
                }
            }
        }
        return false
    }
}
