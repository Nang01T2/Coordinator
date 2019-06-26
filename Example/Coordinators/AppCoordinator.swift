//
//  AppCoordinator.swift
//  CoordinatorPatternSample
//
//  Created by Nang Nguyen on 6/17/19.
//

import Foundation
import Coordinator

final class AppCoordinator: BaseCoordinator {
    
    private var launchInstructor = LaunchInstructor.configure()
    
    // MARK: - Coordinator
    
    override func start(with option: DeepLinkOption?) {
        if option != nil {

        } else {
            switch launchInstructor {
            case .tutorial: runTutorialFlow()
            case .auth: runAuthFlow()
            case .main: runMainFlow()
            }
        }
    }
    
    // MARK: - Private methods
    
    private func runAuthFlow() {
        let authCoordinator = AuthCoordinator(router: self.router as! Router)
        authCoordinator.finishFlow = { [weak self, weak authCoordinator] in
            self?.removeDependency(authCoordinator)
            self?.launchInstructor = LaunchInstructor.configure(tutorialWasShown: false, isAuthorized: true)
            self?.start()
        }
        self.addDependency(authCoordinator)
        authCoordinator.start()
    }
    
    private func runTutorialFlow() {
        let coordinator = TutorialCoordinator(router: self.router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeDependency(coordinator)
            self?.launchInstructor = LaunchInstructor.configure(tutorialWasShown: true, isAuthorized: true)
            self?.start()
        }
        self.addDependency(coordinator)
        coordinator.start()
    }
    
    private func runMainFlow() {
        let coordinator = MainCoordinator(router: self.router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeDependency(coordinator)
            self?.launchInstructor = LaunchInstructor.configure(tutorialWasShown: false, isAuthorized: false)
            self?.start()
        }
        self.addDependency(coordinator)
        coordinator.start()
    }
}
