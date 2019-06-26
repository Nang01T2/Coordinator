//
//  BaseCoordinator.swift
//  Coordinator
//
//  Created by Nang Nguyen on 6/14/19.
//

import Foundation

open class BaseCoordinator : NSObject, Coordinator {
    
    // MARK: Vars and Lets
    public var childCoordinators : [Coordinator] = []
    public var router: Router
    public var finishFlow: (() -> Void)?

    // MARK: - Init
    public init(router: Router) {
        self.router = router
    }
    
    // MARK: - Coordinator
    
    open func start() {
        start(with: nil)
    }
    
    open func start(with option: DeepLinkOption?) {
        fatalError("Children should implement `start`.")
    }
}
