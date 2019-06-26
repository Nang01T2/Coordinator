//
//  AuthCoordinator.swift
//  CoordinatorPatternSample
//
//  Created by Nang Nguyen on 6/17/19.
//

import Foundation
import Coordinator

final class AuthCoordinator: BaseCoordinator {
    
    // MARK: - Coordinator
    
    override func start() {
        self.showLoginViewController()
    }
    
    // MARK: - Private methods
    
    private func showLoginViewController() {
        let loginVC = LoginViewController.instantiate(fromStoryboard: "Authentication")
        loginVC.onLogin = { [weak self] in
            self?.finishFlow?()
        }
        loginVC.onRegister = { [weak self] in
            self?.showRegisterViewController()
        }
        loginVC.onChangePassword = { [weak self] in
            self?.showForgetPassword(module: loginVC)
        }
        self.router.setRootModule(loginVC, hideBar: true)
    }
    
    private func showRegisterViewController() {
        let registerVC = RegisterViewController.instantiate(fromStoryboard: "Authentication")
        registerVC.onBack = { [weak self] in
            self?.router.popModule()
        }
        registerVC.onRegister = { [weak self] in
            self?.router.popModule()
        }
        self.router.push(registerVC)
    }
    
    private func showForgetPassword(module: LoginViewController) {
        let coordinator = ChangePasswordCoordinator(router: self.router)
        coordinator.finishFlow = { [weak self, weak module, weak coordinator] in
            self?.removeDependency(coordinator)
            self?.router.popToModule(module: module , animated: true)
        }
        self.addDependency(coordinator)
        coordinator.start()
    }
}
