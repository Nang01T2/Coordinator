//
//  TutorialCoordinator.swift
//  CoordinatorPatternSample
//
//  Created by Nang Nguyen on 6/18/19.
//

import Foundation
import Coordinator

final class TutorialCoordinator: BaseCoordinator {
    
    override func start() {
        self.showTutorialViewController()
    }
    
    private func showTutorialViewController() {
        let tutorialVC = TutorialViewController.instantiate(fromStoryboard: "Tutorial")
        tutorialVC.onFinish = { [weak self] in
            self?.finishFlow?()
        }
        
        self.router.setRootModule(tutorialVC, transition: FadeAnimator(animationDuration: 0.5, isPresenting: true) , hideBar: true)
    }
}
