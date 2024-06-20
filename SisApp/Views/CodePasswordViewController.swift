//
//  CodePasswordViewController.swift
//  SisApp
//
//  Created by Матвей Авдеев on 20.06.2024.
//

import UIKit

class CodePasswordViewController: UIViewController {
    
    private lazy var mainView = CodePasswordView()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        mainView.codeTextField.delegate = self
        mainView.delegate = self
    }
    
}

extension CodePasswordViewController: CodePasswordViewButtonDelegate {
    func backButtonTapped() {
        dismiss(animated: true) {
            Container.shared.router.presentMainViewController()
        }
    }
    
}

extension CodePasswordViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let currentText = textField.text ?? ""
            let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
            
            if newText.count > 4 {
                return false
            }
            
        for (index, circle) in mainView.codeCircles.enumerated() {
                if index < newText.count {
                    circle.backgroundColor = UIColor(named: "registerButtonBackground")
                    mainView.containerView.layer.borderWidth = 1
                    mainView.containerView.layer.borderColor = UIColor(named: "registerButtonBackground")?.cgColor
                } else {
                    circle.backgroundColor = .lightGray
                    mainView.containerView.layer.borderWidth = 0
                }
            }
            
            if newText.count == 4 {
                dismiss(animated: true) {
                    Container.shared.router.presentCodeSuccessViewController()
                }
            }
            
            return true
        }
    }

