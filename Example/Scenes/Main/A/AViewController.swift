//
//  AViewController.swift
//  CoordinatorPatternSample
//
//  Created by Nang Nguyen on 6/18/19.
//

import UIKit


protocol AViewControllerProtocol: class {
    var onGoToB: (() -> Void)? { get set }
    var onGoToProfile: (() -> Void)? { get set }
}

class AViewController: UIViewController, Storyboarded, AViewControllerProtocol {

    var onGoToB: (() -> Void)?
    var onGoToProfile: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    
    @IBAction func goToB() {
        self.onGoToB?()
    }
    
    @IBAction func profile() {
        self.onGoToProfile?()
    }

}
