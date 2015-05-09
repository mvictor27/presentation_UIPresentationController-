//
//  OverlayViewController.swift
//  presentation
//
//  Created by Victor M on 25/11/2014.
//  Copyright (c) 2014 Victor M. All rights reserved.
//

import UIKit


class OverlayViewController: UIViewController {
    
    var imageContainer = UIImageView()
    var imageContainerSecond = UIImageView()
    var image:UIImage!
    var closeButton:UIButton!
    
    
    
     init() {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .Custom
        
        //         self.modalPresentationStyle = .FormSheet
        //         self.modalTransitionStyle = .CrossDissolve
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUIComponent()
    }
    
    func createUIComponent() {
        
        var frameView = self.view.bounds
        closeButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        closeButton.frame = CGRectMake(0, 0, 30, 30)
        closeButton.backgroundColor = UIColor.grayColor()
        closeButton.setTitle("X", forState: UIControlState.Normal)
        closeButton.addTarget(self, action: "buttonCloseClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        
        imageContainer.frame = CGRectMake(CGRectGetMaxX(closeButton.frame), CGRectGetMaxY(closeButton.frame), 100, 100)
        imageContainer.contentMode = .ScaleAspectFit
        
        imageContainerSecond.frame = CGRectMake(CGRectGetMaxX(imageContainer.frame) + 20,CGRectGetMaxY(closeButton.frame),100, 100)
        imageContainerSecond.contentMode = .ScaleAspectFit
        
        addUIComponent(self.view)
    }
    
    func addUIComponent(let uiView:UIView){
        
        uiView.addSubview(closeButton)
        uiView.addSubview(imageContainer)
        uiView.addSubview(imageContainerSecond)
        
    }
    
    func buttonCloseClicked(sender:UIButton!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func setImages(imgName:String){
        imageContainer.image = filterImage(imgName: imgName, filterName: "CISepiaTone")
        imageContainerSecond.image = filterImage(imgName: imgName, filterName: "CISepiaTone")
    }
    
    
    func filterImage(#imgName:String, filterName:String) -> UIImage{
        
        let fileURL = NSBundle.mainBundle().URLForResource(imgName, withExtension: "png")
        let beginImage = CIImage(contentsOfURL: fileURL)
        let filter = CIFilter(name: filterName)
        filter.setValue(beginImage, forKey: kCIInputImageKey)
        filter.setValue(0.5, forKey: kCIInputIntensityKey)
        let newImage = UIImage(CIImage: filter.outputImage)
        return newImage!
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
