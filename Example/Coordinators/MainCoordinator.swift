//
//  MainCoordinator.swift
//  CoordinatorPatternSample
//
//  Created by Nang Nguyen on 6/18/19.
//

import Foundation
import Coordinator

final class MainCoordinator: BaseCoordinator {
    
    override func start() {
        self.showAViewController()
    }
    
    // MARK: - Private methods
    
    private func showAViewController() {
        let aVC = AViewController.instantiate(fromStoryboard: "Main")
        aVC.onGoToB = { [unowned self] in
            self.showBViewController()
        }
        aVC.onGoToProfile = { [unowned self] in
            self.showProfile()
        }
        self.router.setRootModule(aVC, hideBar: true)
    }
    
    private func showBViewController() {
        let bVC = BViewController.instantiate(fromStoryboard: "Main")
        bVC.onBack = { [unowned self] in
            self.router.popModule()
        }
        bVC.onLogout = { [unowned self] in
            self.finishFlow?()
        }
        self.router.push(bVC)
    }
    
    private func showProfile() {
        let profileVC = ProfileViewController.instantiate(fromStoryboard: "Main")
        profileVC.onBack = { [weak self] in
            self?.router.popModule()
        }
        profileVC.onChangePassword = { [weak self] in
            self?.showForgetPassword(module: profileVC)
        }
        self.router.push(profileVC)
    }
    
    private func showForgetPassword(module: ProfileViewController) {
        let coordinator = ChangePasswordCoordinator(router: self.router)
        coordinator.finishFlow = { [unowned self, weak module, unowned coordinator] in
            self.removeDependency(coordinator)
            self.router.popToModule(module: module , animated: true)
        }
        self.addDependency(coordinator)
        coordinator.start()
    }
}
