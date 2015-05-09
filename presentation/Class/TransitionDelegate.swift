//
//  TransitionDelegate.swift
//  presentation
//
//  Created by Victor M on 25/11/2014.
//  Copyright (c) 2014 Victor M. All rights reserved.
//

import UIKit

class TransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController!, sourceViewController source: UIViewController) -> UIPresentationController? {
        return PresentationController(presentedViewController: presented, presentingViewController: presenting)
        
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return AnimateTransitionVC(isPresented: true)
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController?!) -> UIViewControllerAnimatedTransitioning! {
        
        return AnimateTransitionVC(isPresented: false)
    }
    
}
