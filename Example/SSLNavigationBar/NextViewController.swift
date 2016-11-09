//
//  NextViewController.swift
//  SSLNavigationBar
//
//  Created by smilelu on 16/8/24.
//  Copyright © 2016年 smilelu. All rights reserved.
//

import UIKit
import SSLNavigationBar

class NextViewController: SLBaseViewController {
    
    var titleStyleBtn:UIButton!
    
    var imageStyleBtn:UIButton!
    
    var clearItemsBtn:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "NextViewController";
        
        self.naviBackgroundColor = UIColor.green
        
        titleStyleBtn = UIButton()
        titleStyleBtn.setTitleColor(UIColor.blue, for: UIControlState())
        titleStyleBtn.setTitle("TitleStyle", for: UIControlState())
        titleStyleBtn.addTarget(self, action: #selector(titleStyleAction(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(titleStyleBtn)
        
        imageStyleBtn = UIButton()
        imageStyleBtn.setTitleColor(UIColor.blue, for: UIControlState())
        imageStyleBtn.setTitle("ImageStyle", for: UIControlState())
        imageStyleBtn.addTarget(self, action: #selector(imageStyleAction(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(imageStyleBtn)
        
        clearItemsBtn = UIButton()
        clearItemsBtn.setTitleColor(UIColor.blue, for: UIControlState())
        clearItemsBtn.setTitle("clearItems", for: UIControlState())
        clearItemsBtn.addTarget(self, action: #selector(clearItemsAction(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(clearItemsBtn)
        
        self.setLayout()
    }
    
    func setLayout() -> Void {
        titleStyleBtn.snp_makeConstraints { (make) in
            make.top.equalTo(self.view).offset(100)
            make.centerX.equalTo(self.view)
        }
        
        imageStyleBtn.snp_makeConstraints { (make) in
            make.top.equalTo(self.titleStyleBtn.snp_bottom).offset(10)
            make.centerX.equalTo(self.view)
        }
        
        clearItemsBtn.snp_makeConstraints { (make) in
            make.top.equalTo(self.imageStyleBtn.snp_bottom).offset(10)
            make.centerX.equalTo(self.view)
        }
    }
    
    func titleStyleAction(_ sender:UIButton) -> Void {
        let rightItem1 = SLBarButtonItem(title: "编辑", target: self, action: #selector(rightItemClick(_:)))
        let rightItem2 = SLBarButtonItem(title: "删除", target: self, action: #selector(rightItemClick(_:)))
        self.naviBar.rightItems = [rightItem1, rightItem2]
    }
    
    func imageStyleAction(_ sender:UIButton) -> Void {
        let rightItem1 = SLBarButtonItem(image: UIImage(named: "titlebar_more"), target: self, action: #selector(rightItemClick(_:)))
        let rightItem2 = SLBarButtonItem(image: UIImage(named: "titlebar_scan"), target: self, action: #selector(rightItemClick(_:)))
        self.naviBar.rightItems = [rightItem1, rightItem2]
    
    }
    
    func clearItemsAction(_ sender: UIButton) -> Void {
        self.naviBar.rightItems = nil
    }
    
    func rightItemClick(_ sender:SLBarButtonItem) -> Void {
        NSLog("\(sender.currentTitle)")
        //Add Click Action
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
