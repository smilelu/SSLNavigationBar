//
//  SLBarButtonItem.swift
//  Pods
//
//  Created by smilelu on 16/8/22.
//
//

import UIKit

open class SLBarButtonItem: UIButton {

    public convenience init(image: UIImage?, target:AnyObject?, action: Selector) {
        self.init()
        
        self.setImage(image, for: UIControlState())
        self.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
    }
    
    public convenience init(title: String?, target:AnyObject?, action: Selector ) {
        self.init()
        self.titleLabel?.font = UIFont .systemFont(ofSize: 14.0)
        self.setTitle(title, for: UIControlState())
        self.setTitleColor(UIColor.white, for: UIControlState())
        self.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: UIControlState.highlighted)
        self.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
    }

}
