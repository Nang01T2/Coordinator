//
//  BViewController.swift
//  CoordinatorPatternSample
//
//  Created by Nang Nguyen on 6/18/19.
//

import UIKit


protocol BViewControllerProtocol: class {
    var onBack: (() -> Void)? { get set }
    var onLogout: (() -> Void)? { get set }
}

class BViewController: UIViewController, Storyboarded, BViewControllerProtocol {

    var onBack: (() -> Void)?
    var onLogout: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    
    @IBAction func back() {
        self.onBack?()
    }
    
    @IBAction func logout() {
        self.onLogout?()
    }

}
