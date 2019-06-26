//
//  ChangePasswordCoordinator.swift
//  CoordinatorPatternSample
//
//  Created by Nang Nguyen on 6/18/19.
//

import Foundation
import Coordinator

final class ChangePasswordCoordinator: BaseCoordinator {
    
    // MARK: - Coordinator
    
    override func start() {
        self.showChangePasswordStep1()
    }
    
    // MARK: - Private methods
    
    private func showChangePasswordStep1() {
        let changePasswordStep1VC = ChangePasswordStep1ViewController.instantiate(fromStoryboard: "ChangePassword")
        changePasswordStep1VC.onBack = { [unowned self] in
            self.finishFlow?()
        }
        changePasswordStep1VC.onNextStep = { [unowned self] in
            self.showChangePasswordStep2()
        }
        self.router.push(changePasswordStep1VC)
    }
    
    private func showChangePasswordStep2() {
        let changePasswordStep2VC = ChangePasswordStep2ViewController.instantiate(fromStoryboard: "ChangePassword")
        changePasswordStep2VC.onBack = { [unowned self] in
            self.router.popModule()
        }
        changePasswordStep2VC.onResetPassword = { [unowned self] in
            self.finishFlow?()
        }
        self.router.push(changePasswordStep2VC)
    }
}
