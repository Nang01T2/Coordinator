//
//  ProfileViewController.swift
//  CoordinatorPatternSample
//
//  Created by Nang Nguyen on 6/18/19.
//

import UIKit


protocol ProfileViewControllerProtocol: class {
    var onBack: (() -> Void)? { get set }
    var onChangePassword: (() -> Void)? { get set }
    
}

class ProfileViewController: UIViewController, Storyboarded, ProfileViewControllerProtocol {

    var onBack: (() -> Void)?
    var onChangePassword: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Actions
    
    @IBAction func back() {
        self.onBack?()
    }
    
    @IBAction func changePassword() {
        self.onChangePassword?()
    }
}
