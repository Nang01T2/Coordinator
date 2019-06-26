//
//  ChangePasswordStep1ViewController.swift
//  CoordinatorPatternSample
//
//  Created by Nang Nguyen on 6/18/19.
//

import UIKit

protocol ChangePasswordStep2ViewControllerProtocol: class {
    var onResetPassword: (() -> Void)? { get set }
    var onBack: (() -> Void)? { get set }
}

class ChangePasswordStep2ViewController: UIViewController, Storyboarded, ChangePasswordStep2ViewControllerProtocol {

    // MARK: - ChangePasswordStep2ViewControllerProtocol
    
    var onResetPassword: (() -> Void)?
    var onBack: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    
    @IBAction func back() {
        self.onBack?()
    }
    
    @IBAction func resetPassword() {
        self.onResetPassword?()
    }

}
