//
//  SLBaseViewController.swift
//  Pods
//
//  Created by smilelu on 16/8/23.
//
//

import UIKit
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


open class SLBaseViewController: UIViewController {
    
    open let naviBar: SLNavigationBar! = {
        return SLNavigationBar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 64));
    }()
    
    override open var title : String? {
        get {
            return super.title
        }
        set {
            super.title = newValue
            self.naviBar.slTitleLabel?.text = newValue
        }
    }
    
    open var naviBackgroundColor: UIColor? {
        didSet {
            self.naviBar.backgroundColor = self.naviBackgroundColor
        }
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        initNaviBar()
    }
    
    open func initNaviBar() -> Void {
        self.view.addSubview(self.naviBar)
        NSLog("\(naviBackgroundColor)")
        self.naviBar.backgroundColor = (naviBackgroundColor == nil ? UIColor(red: 50.0/255.0, green: 165.0/255.0, blue: 248.0/255.0, alpha: 1.0) : naviBackgroundColor)
        if (self.navigationController?.viewControllers.count > 1) {
            self.naviBar.leftItem = SLBarButtonItem(image: UIImage(named: "Frameworks/SSLNavigationBar.framework/SSLNavigationBar.bundle/topbar_back"), target: self, action: #selector(backClick(_:)))
        }
    }
    
    func backClick(_ sender: SLBarButtonItem) -> Void {
        self.navigationController?.popViewController(animated: true)
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
