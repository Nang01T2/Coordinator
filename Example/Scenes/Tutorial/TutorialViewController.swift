//
//  TutorialViewController.swift
//  CoordinatorPatternSample
//
//  Created by Nang Nguyen on 6/18/19.
//

import UIKit


protocol TutorialViewControllerProtocol: class {
    var onFinish: (() -> Void)? { get set }
}

class TutorialViewController: UIViewController, Storyboarded, TutorialViewControllerProtocol {

    var onFinish: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func finish() {
        self.onFinish?()
    }
}
