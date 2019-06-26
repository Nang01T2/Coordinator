//
//  LoginViewController.swift
//  CoordinatorPatternSample
//
//  Created by Nang Nguyen on 6/17/19.
//

import UIKit


protocol LoginViewControllerProtocol: class {
    var onLogin: (() -> Void)? { get set }
    var onRegister: (() -> Void)? { get set }
    var onChangePassword: (() -> Void)? { get set }
}

class LoginViewController: UIViewController, LoginViewControllerProtocol, Storyboarded {
    
    // MARK: - Vars and Lets
    var viewModel: LoginViewModelProtocol?
    
    // MARK: - LoginViewControllerProtocol
    var onLogin: (() -> Void)?
    var onRegister: (() -> Void)?
    var onChangePassword: (() -> Void)?
    
    // MARK: - Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Actions
    
    @IBAction func login() {
        self.onLogin?()
    }
    
    @IBAction func register() {
        self.onRegister?()
    }
    
    @IBAction func forgetPassword() {
        self.onChangePassword?()
    }
}
