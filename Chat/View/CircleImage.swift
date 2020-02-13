//
//  CircleImage.swift
//  Chat
//
//  Created by Alexandru Maftei on 2/13/20.
//  Copyright © 2020 Alexandru Maftei. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImage: UIImageView {

    override func awakeFromNib() {
        setupView()
    }
    
    func setupView(){
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override  func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }


}
