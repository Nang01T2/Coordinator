//
//  Storyboarded.swift
//  MyDevKit iOS
//
//  Created by Nang Nguyen on 6/14/19.
//

import UIKit

public protocol Storyboarded {
    static func instantiate(fromStoryboard filename: String, at bundle: Bundle) -> Self
}

public extension Storyboarded where Self: UIViewController {
    static func instantiate(fromStoryboard filename: String = "Main", at bundle: Bundle = Bundle.main) -> Self {
        // this pulls out "MyApp.MyViewController"
        let fullName = NSStringFromClass(self)
        
        // this splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]
        
        // load our storyboard
        let storyboard = UIStoryboard(name: filename, bundle: bundle)
        
        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
