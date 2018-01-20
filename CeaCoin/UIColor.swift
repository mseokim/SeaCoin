//
//  UIColor.swift
//  CeaCoin
//
//  Created by 김민서 on 2018. 1. 20..
//  Copyright © 2018년 김민서. All rights reserved.
//

import UIKit

extension UIColor {
    
    static let logoColor = UIColor(hex: 0xFB5082)
    
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha : a
        )
    }
    convenience init(hex: Int, a: CGFloat = 1.0) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF,
            a: a
        )
    }
}
