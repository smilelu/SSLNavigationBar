//
//  SLNavigationBar.swift
//  Pods
//
//  Created by smilelu on 16/8/22.
//
//

import UIKit
import SnapKit

open class SLNavigationBar: UIView {
    
    open var slTitleView:UIView!
    
    var slTitleLabel:UILabel?
    
    open var lineView:UIView!
    
    open var leftItem:UIView? {
        didSet {
            for v:UIView in self.leftView.subviews {
                v.removeFromSuperview()
            }
            self.leftView.addSubview(leftItem!)
            
            self.layoutIfNeeded()
            leftItem!.snp_makeConstraints { (make) in
                make.top.bottom.equalTo(self.leftView)
                make.width.greaterThanOrEqualTo(30)
                make.left.equalTo(self.leftView).offset(8)
                make.right.equalTo(self.leftView).offset(-8)
            }
        }
    }
    
    open var leftItems:Array<UIView>? {
        didSet {
            for v:UIView in self.leftView.subviews {
                v.removeFromSuperview()
            }
            
            if leftItems == nil {
                return
            }
            
            let count:Int = (leftItems?.count)!
            for  i in 0 ..< count {
                let item = leftItems![i]
                self.leftView.addSubview(item)
                self.layoutIfNeeded()
                item.snp_makeConstraints({ (make) in
                    make.top.bottom.equalTo(self.leftView)
                    make.width.greaterThanOrEqualTo(30)
                    make.left.equalTo((i > 0 ? leftItems![i-1].snp_right : self.leftView.snp_left)).offset(8)
                    if i == leftItems!.count - 1 {
                        make.right.equalTo(leftView)
                    }
                })
            }
        }
    }
    
    open var rightItem:UIView? {
        didSet {
            for v:UIView in self.leftView.subviews {
                v.removeFromSuperview()
            }
            self.rightView.addSubview(rightItem!)
            
            self.layoutIfNeeded()
            rightItem!.snp_makeConstraints { (make) in
                make.top.bottom.equalTo(self.rightView)
                make.width.greaterThanOrEqualTo(30)
                make.left.equalTo(self.rightView).offset(8)
                make.right.equalTo(self.rightView).offset(-8)
            }
        }
    }
    
    open var rightItems:Array<UIView>? {
        didSet {
            for v:UIView in self.rightView.subviews {
                v.removeFromSuperview()
            }
            if rightItems == nil {
                return
            }
            let count:Int = (rightItems?.count)!
            for  i in 0 ..< count {
                let item = rightItems![i]
                self.rightView.addSubview(item)
                self.layoutIfNeeded()
                item.snp_makeConstraints({ (make) in
                    make.top.bottom.equalTo(self.leftView)
                    make.width.greaterThanOrEqualTo(30)
                    make.right.equalTo((i > 0 ? rightItems![i-1].snp_left : self.rightView.snp_right)).offset(-8)
                    if i == rightItems!.count - 1 {
                        make.left.greaterThanOrEqualTo(rightView)
                    }
                })
            }
        }
    }
    
    fileprivate var leftView:UIView!
    fileprivate var rightView:UIView!
    
    init () {
        super.init(frame: CGRect.zero)
        initializer()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializer()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializer() -> Void {
        leftView = UIView()
        self.addSubview(leftView)
        
        rightView = UIView()
        self.addSubview(rightView)
        
        slTitleView = UIView()
        self.addSubview(slTitleView)
        
        slTitleLabel = UILabel()
        slTitleLabel?.textColor = UIColor.white
        slTitleLabel?.font = UIFont.systemFont(ofSize: 18.0)
        slTitleView.addSubview(slTitleLabel!)
        
        lineView = UIView()
        lineView.backgroundColor = UIColor.gray
        self.addSubview(lineView)
    }

    override open func layoutSubviews() {
        
        leftView.snp_makeConstraints { (make) in
            make.top.equalTo(self).offset(20)
            make.left.equalTo(self)
            make.bottom.equalTo(self)
        }
        
        rightView.snp_makeConstraints { (make) in
            make.top.equalTo(self).offset(20)
            make.right.equalTo(self)
            make.bottom.equalTo(self)
        }
        
        slTitleView.snp_makeConstraints { (make) in
            make.top.equalTo(self).offset(20)
            make.centerX.equalTo(self)
            make.left.greaterThanOrEqualTo(self.leftView.snp_right)
            make.right.greaterThanOrEqualTo(self.rightView.snp_left)
            make.bottom.equalTo(self)
        }
        
        slTitleLabel?.snp_makeConstraints({ (make) in
            make.center.equalTo(self.slTitleView)
        })
        
        lineView.snp_makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.left.right.bottom.equalTo(self)
        }
    }

}
