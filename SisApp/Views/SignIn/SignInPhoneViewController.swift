//
//  SignInPhoneViewController.swift
//  SisApp
//
//  Created by Матвей Авдеев on 19.06.2024.
//


import UIKit

class SignInPhoneViewController: UIViewController {
    
    private lazy var mainView = SignInPhoneView()
    
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
        mainView.phoneTextField.delegate = self
    }
    
}

extension SignInPhoneViewController: SignInPhoneViewButtonDelegate {
    func getCodeButtonTapped() {
        dismiss(animated: true) {
            Container.shared.router.presentSignInCodeViewControllr()
        }
    }
    
    func backButtonTapped() {
        dismiss(animated: true) {
            Container.shared.router.presentScreenSaverViewController()
        }
    }
}

extension SignInPhoneViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 10
        let currentString: NSString = textField.text! as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        
        if newString.length >= maxLength {
            textField.resignFirstResponder()
            mainView.getCodeButton.isEnabled = true
        }
        
        return newString.length <= maxLength
    }
}
