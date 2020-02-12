//
//  ChannelVC.swift
//  Chat
//
//  Created by Alexandru Maftei on 2/12/20.
//  Copyright © 2020 Alexandru Maftei. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set rear width 
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
    }
    

}
