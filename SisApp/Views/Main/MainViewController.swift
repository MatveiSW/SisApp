//
//  MainViewController.swift
//  SisApp
//
//  Created by Матвей Авдеев on 18.06.2024.
//

import UIKit

class MainViewController: UIViewController {

    private lazy var mainView = MainView()
    
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

extension MainViewController: MainViewButtonDelegate {
    func signInButton() {
        dismiss(animated: true) {
            Container.shared.router.presentCodePasswordViewControllr()
        }
    }
    
    func registerButton() {
        dismiss(animated: true) {
            Container.shared.router.presentRegisterWithPhoneViewController()
        }
    }
    
    
}

