//
//  SignInViewController.swift
//  SisApp
//
//  Created by Матвей Авдеев on 18.06.2024.
//

import UIKit

class ScreenSaverViewController: UIViewController {
    
    private lazy var mainView = ScreenSaverView()
    
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
    }
    
}

extension ScreenSaverViewController: ScreenSaverViewButtonDelegate {
    func signInButton() {
        dismiss(animated: true) {
            Container.shared.router.presentSignInPhoneViewController()
        }
    }
    
    func registerButton() {
        dismiss(animated: true) {
            Container.shared.router.presentRegisterWithPhoneViewController()
        }
    }
    
    
}
