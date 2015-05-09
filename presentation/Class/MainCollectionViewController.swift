//
//  MainCollectionViewController.swift
//  presentation
//
//  Created by Victor M on 23/11/2014.
//  Copyright (c) 2014 Victor M. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class MainCollectionViewController: UICollectionViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var layout:UICollectionViewFlowLayout!
    var images:[String]!
    var overlayTrasitionDelegate: UIViewControllerTransitioningDelegate!
    
     init() {
        
        layout = UICollectionViewFlowLayout()
        layout.headerReferenceSize.height = 40
        layout.itemSize = CGSize(width: 100, height: 100)
        
        super.init(collectionViewLayout: layout)
        self.collectionView?.backgroundColor = UIColor.whiteColor()
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        self.collectionView?.registerClass(ImageCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
        
        images = ["0","1","2","3","4","5"]
        overlayTrasitionDelegate = TransitionDelegate()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return images.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell  = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ImageCollectionViewCell
        cell.backgroundColor = .clearColor()
        
        let image = UIImage(named: images[indexPath.item])
        cell.image = image
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        var overlay = OverlayViewController()
        
        overlay.transitioningDelegate = overlayTrasitionDelegate
        
        overlay.setImages(images[indexPath.item])
        
        self.presentViewController(overlay, animated: true) { () -> Void in
            
        }
        collectionView.cellForItemAtIndexPath(indexPath)?.backgroundColor = .grayColor()
    }
    
    
}
