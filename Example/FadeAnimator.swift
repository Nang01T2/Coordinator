//
//  FadeAnimator.swift
//  MyDevKit iOS
//
//  Created by Nang Nguyen on 6/18/19.
//

import UIKit

public class FadeAnimator: NSObject {
    
    // MARK: - Vars & Lets
    
    let animationDuration: Double
    weak var storedContext: UIViewControllerContextTransitioning?
    private var isPresenting = false
    
    // MARK: - Initialization
    
    public init(animationDuration: Double, isPresenting: Bool) {
        self.animationDuration = animationDuration
        self.isPresenting = isPresenting
    }
    
}

// MARK: - Extensions
// MARK: - UIViewControllerAnimatedTransitioning

extension FadeAnimator: UIViewControllerAnimatedTransitioning {
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
        
        if self.isPresenting {
            if let toView = toView {
                toView.alpha = 0
                transitionContext.containerView.addSubview(toView)
            }
        } else {
            if let toView = toView {
                if let fromView = fromView {
                    fromView.alpha = 1
                    transitionContext.containerView.insertSubview(toView, belowSubview: fromView)
                }
            }
        }
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration,
                       animations: {
                        if self.isPresenting {
                            toView?.alpha = 1
                        } else {
                            fromView?.alpha = 0
                        }
        }) { finished in
            transitionContext.completeTransition(true)
        }
    }
    
}
