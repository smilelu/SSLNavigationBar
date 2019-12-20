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
        
        self.setImage(image, for: UIControl.State())
        self.addTarget(target, action: action, for: UIControl.Event.touchUpInside)
    }
    
    public convenience init(title: String?, target:AnyObject?, action: Selector ) {
        self.init()
        self.titleLabel?.font = UIFont .systemFont(ofSize: 14.0)
        self.setTitle(title, for: UIControl.State())
        self.setTitleColor(UIColor.white, for: UIControl.State())
        self.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: UIControl.State.highlighted)
        self.addTarget(target, action: action, for: UIControl.Event.touchUpInside)
    }

}
