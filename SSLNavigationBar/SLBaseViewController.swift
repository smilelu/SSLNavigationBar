//
//  SLBaseViewController.swift
//  Pods
//
//  Created by smilelu on 16/8/23.
//
//

import UIKit

public class SLBaseViewController: UIViewController {
    
    public let naviBar: SLNavigationBar! = {
        return SLNavigationBar(frame:CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 64));
    }()
    
    override public var title : String? {
        get {
            return super.title
        }
        set {
            super.title = newValue
            self.naviBar.slTitleLabel?.text = newValue
        }
    }
    
    public var naviBackgroundColor: UIColor? {
        didSet {
            self.naviBar.backgroundColor = self.naviBackgroundColor
        }
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        initNaviBar()
    }
    
    public func initNaviBar() -> Void {
        self.view.addSubview(self.naviBar)
        NSLog("\(naviBackgroundColor)")
        self.naviBar.backgroundColor = (naviBackgroundColor == nil ? UIColor(red: 50.0/255.0, green: 165.0/255.0, blue: 248.0/255.0, alpha: 1.0) : naviBackgroundColor)
        if (self.navigationController?.viewControllers.count > 1) {
            self.naviBar.leftItem = SLBarButtonItem(image: UIImage(named: "Frameworks/SSLNavigationBar.framework/SSLNavigationBar.bundle/topbar_back"), target: self, action: #selector(backClick(_:)))
        }
    }
    
    func backClick(sender: SLBarButtonItem) -> Void {
        self.navigationController?.popViewControllerAnimated(true)
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
