//
//  Coordinator.swift
//  Coordinator
//
//  Created by Nang Nguyen on 6/14/19.
//

import UIKit

public protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    var router: Router { get set }
    
    func start()
    func start(with option: DeepLinkOption?)
}

public extension Coordinator {
    
    func addDependency(_ coordinator: Coordinator) {
        for element in childCoordinators {
            if element === coordinator { return }
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator?) {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
}
