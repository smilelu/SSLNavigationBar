//
//  SLBarButtonItem.swift
//  Pods
//
//  Created by smilelu on 16/8/22.
//
//

import UIKit

public class SLBarButtonItem: UIButton {

    public convenience init(image: UIImage?, target:AnyObject?, action: Selector) {
        self.init()
        
        self.setImage(image, forState: UIControlState.Normal)
        self.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    public convenience init(title: String?, target:AnyObject?, action: Selector ) {
        self.init()
        self.titleLabel?.font = UIFont .systemFontOfSize(14.0)
        self.setTitle(title, forState: UIControlState.Normal)
        self.setTitleColor(UIColor .whiteColor(), forState: UIControlState.Normal)
        self.setTitleColor(UIColor.whiteColor().colorWithAlphaComponent(0.5), forState: UIControlState.Highlighted)
        self.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
    }

}
