//
//  RegisterPhoneViewController.swift
//  SisApp
//
//  Created by Матвей Авдеев on 18.06.2024.
//

import UIKit

class RegisterPhoneViewController: UIViewController {
    
    private lazy var mainView = RegisterPhoneView()
    
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

extension RegisterPhoneViewController: RegisterPhoneViewButtonDelegate {
    func getCodeButtonTapped() {
        dismiss(animated: true) {
            Container.shared.router.presentCodePhoneViewController()
        }
    }
    
    func backButtonTapped() {
        dismiss(animated: true) {
            Container.shared.router.presentScreenSaverViewController()
        }
    }
}

extension RegisterPhoneViewController: UITextFieldDelegate {
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
