//
//  RegisterViewController.swift
//  CoordinatorPatternSample
//
//  Created by Nang Nguyen on 6/17/19.
//

import UIKit


protocol RegisterViewControllerProtocol: class {
    var onRegister: (() -> Void)? { get set }
    var onBack: (() -> Void)? { get set }
}

class RegisterViewController: UIViewController, RegisterViewControllerProtocol, Storyboarded {

    // MARK: - Vars and Lets
    var viewModel: RegisterViewModelProtocol?
    
    // MARK: - RegisterViewControllerProtocol
    
    var onRegister: (() -> Void)?
    var onBack: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func register() {
        self.onRegister?()
    }
    
    @IBAction func back() {
        self.onBack?()
    }
}
