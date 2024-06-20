//
//  ApplicationRouter.swift
//  SisApp
//
//  Created by Матвей Авдеев on 18.06.2024.
//

import UIKit

class ApplicationRouter {
    
    private var transitionHandler: UIViewController!
    
    func setup(_ window: UIWindow?) {
        
        guard let window = window else { return }
        transitionHandler = UIViewController()
        window.backgroundColor = .black
        window.overrideUserInterfaceStyle = .light
        window.rootViewController = transitionHandler
        window.makeKeyAndVisible()
        presentScreenSaverViewController()
//        if KeychainService.loadUserData(userData: "userId") != nil {
//            presentTabBarViewController(selectedVC: 0)
//        } else {
//            presentAuthentificationByEmailViewController()
//        }
    }
    
    public func presentScreenSaverViewController() {
        let vc = ScreenSaverViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        transitionHandler.present(vc, animated: true)
    }
    
    public func presentRegisterWithPhoneViewController() {
        let vc = RegisterPhoneViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        transitionHandler.present(vc, animated: true)
    }
    
    public func presentMainViewController() {
        let vc = MainViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        transitionHandler.present(vc, animated: true)
    }
    
    public func presentCodePhoneViewController() {
        let vc = CodeRegisterPhoneViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        transitionHandler.present(vc, animated: true)
    }
    
    public func presentSignInPhoneViewController() {
        let vc = SignInPhoneViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        transitionHandler.present(vc, animated: true)
    }
    
    public func presentSignInCodeViewControllr() {
        let vc = CodeSignInViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        transitionHandler.present(vc, animated: true)
    }
    
    public func presentCodePasswordViewControllr() {
        let vc = CodePasswordViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        transitionHandler.present(vc, animated: true)
    }
    
    public func presentCodeSuccessViewController() {
        let vc = CodeSuccessViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        transitionHandler.present(vc, animated: true)
    }
    
}

