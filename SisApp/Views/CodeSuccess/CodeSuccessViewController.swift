//
//  CodeSuccessViewController.swift
//  SisApp
//
//  Created by Матвей Авдеев on 20.06.2024.
//

import UIKit

class CodeSuccessViewController: UIViewController {
    
    private lazy var mainView = CodeSuccessView()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
