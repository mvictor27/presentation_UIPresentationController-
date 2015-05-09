//
//  AnimateTransitionVC.swift
//  presentation
//
//  Created by Victor M on 27/11/2014.
//  Copyright (c) 2014 Victor M. All rights reserved.
//

import UIKit

class AnimateTransitionVC: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    var isPresented :Bool = true
    let duration :NSTimeInterval = 0.5
    
    init(isPresented: Bool) {
        self.isPresented = isPresented
        super.init()
    }
    
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning)  {
        if isPresented {
            presentationWithContext(transitionContext)
        } else {
            dismissWithContext(transitionContext)
        }
    }
    
    func presentationWithContext(transitionContext: UIViewControllerContextTransitioning) {
        let presentedController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let presentedControllerView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        let containerView = transitionContext.containerView()
        
        presentedControllerView.frame = transitionContext.finalFrameForViewController(presentedController)
        presentedControllerView.center.y -= containerView.bounds.size.height
        
       // containerView.addSubview(presentedControllerView)
        
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .AllowUserInteraction, animations: {
            presentedControllerView.center.y += containerView.bounds.size.height
            }, completion: {(completed: Bool) -> Void in
                transitionContext.completeTransition(completed)
        })
    }
    
    func dismissWithContext(transitionContext: UIViewControllerContextTransitioning) {
        let presentedControllerView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let containerView = transitionContext.containerView()
        
        
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .AllowUserInteraction, animations: {
            presentedControllerView.center.y += containerView.bounds.size.height
            }, completion: {(completed: Bool) -> Void in
                transitionContext.completeTransition(completed)
        })
    }
    
    
}
