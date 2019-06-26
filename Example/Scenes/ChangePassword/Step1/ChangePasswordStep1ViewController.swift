//
//  ChangePasswordStep1ViewController.swift
//  CoordinatorPatternSample
//
//  Created by Nang Nguyen on 6/18/19.
//

import UIKit


protocol ChangePasswordStep1ViewControllerProtocol: class {
    var onNextStep: (() -> Void)? { get set }
    var onBack: (() -> Void)? { get set }
}

class ChangePasswordStep1ViewController: UIViewController, Storyboarded, ChangePasswordStep1ViewControllerProtocol {

    // MARK: - ChangePasswordStep1ViewControllerProtocol
    
    var onNextStep: (() -> Void)?
    var onBack: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Actions
    
    @IBAction func back() {
        self.onBack?()
    }
    
    @IBAction func nextStep() {
        self.onNextStep?()
    }

}
