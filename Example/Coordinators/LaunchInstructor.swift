//
//  LaunchInstructor.swift
//  CoordinatorPatternSample
//
//  Created by Nang Nguyen on 6/18/19.
//

import Foundation

enum LaunchInstructor {
    case main
    case auth
    case tutorial
    
    // MARK: - Public methods
    
    static func configure( tutorialWasShown: Bool = false, isAuthorized: Bool = false) -> LaunchInstructor {
        
        switch (tutorialWasShown, isAuthorized) {
        case (true, false), (false, false): return .auth
        case (false, true): return .tutorial
        case (true, true): return .main
        }
    }
}
