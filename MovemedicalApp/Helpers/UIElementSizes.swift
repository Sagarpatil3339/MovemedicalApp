//
//  UIElementSizes.swift
//  MovemedicalApp
//
//  Created by Prasad Patil on 4/9/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

import UIKit

class UIElementSizes {
    static var windowWidth: CGFloat = UIScreen.main.bounds.width
    static var windowHeight: CGFloat = UIScreen.main.bounds.height
    
    static func forLabel(sender: UILabel, size: CGFloat? = 10.0, textColor: UIColor? = UIColor.darkText){
        sender.font = UIFont.italicSystemFont(ofSize: size ?? 0.0)
        sender.numberOfLines = 0
        sender.textColor = textColor
    }
}
