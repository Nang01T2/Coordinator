//
//  AppDelegate.swift
//  Example
//
//  Created by Nang Nguyen on 6/26/19.
//

import UIKit
import Coordinator

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootController: UINavigationController {
        return self.window!.rootViewController as! UINavigationController
    }
    private lazy var applicationCoordinator: Coordinator = AppCoordinator(router: Router(rootController: self.rootController))

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.applicationCoordinator.start(with: nil)
        return true
    }

}

