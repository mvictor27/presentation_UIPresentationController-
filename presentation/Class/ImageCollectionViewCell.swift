//
//  ImageCollectionViewCell.swift
//  presentation
//
//  Created by Victor M on 23/11/2014.
//  Copyright (c) 2014 Victor M. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    var image:UIImage!
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let imageView =  UIImageView(frame: self.bounds)
        imageView.image = image
        imageView.contentMode = .ScaleAspectFit
        contentView.addSubview(imageView)
        
    }
}
