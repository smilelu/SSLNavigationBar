//
//  SLBaseNaviController.swift
//  SLNavigationBar-swfit
//
//  Created by smilelu on 16/8/23.
//  Copyright © 2016年 smilelu. All rights reserved.
//

import UIKit

class SLBaseNaviController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
