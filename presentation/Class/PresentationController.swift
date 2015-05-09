//
//  FilterPresentationController.swift
//  presentation
//
//  Created by Victor M on 23/11/2014.
//  Copyright (c) 2014 Victor M. All rights reserved.
//

import UIKit

class PresentationController: UIPresentationController {
    
    override init(presentedViewController: UIViewController!, presentingViewController: UIViewController!) {
        
        presentedViewController.view.backgroundColor = .grayColor()
        
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
        
    }
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        self.containerView.addSubview(self.presentedView())
        
    }
    
    
    override func dismissalTransitionWillBegin()  {
        super.dismissalTransitionWillBegin()
    }
    
    override func dismissalTransitionDidEnd(completed: Bool) {
        super.dismissalTransitionDidEnd(completed)
    }
    
    override func frameOfPresentedViewInContainerView() -> CGRect {
        var frame = self.containerView.bounds;
        return CGRectMake(0.0, CGRectGetMidY(frame), CGRectGetWidth(frame), CGRectGetHeight(frame)/3)
    }
    
    
    
}
