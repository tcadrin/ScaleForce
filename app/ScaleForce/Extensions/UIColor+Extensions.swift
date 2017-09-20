//
//  UIColor+Extensions.swift
//  Wellnest
//
//  Created by Jay Clark on 3/29/17.
//  Copyright © 2017 LongTime. All rights reserved.
//

import UIKit

extension UIColor {

    /// Get a "highlighted" version of self, with half the
    /// current color's alpha value.
    var highlighted: UIColor {
        var currentAlpha = CGFloat(0)
        if self.getWhite(nil, alpha: &currentAlpha) {
            return self.withAlphaComponent(currentAlpha / 2)
        }
        else {
            // Fallback to 50% alpha
            return self.withAlphaComponent(0.5)
        }
    }

    /// UIColor from RGB integers (0 - 255)
    /// - Parameters:
    ///   - red: Int
    ///   - green: Int
    ///   - blue: Int
    ///   - alpha: Double, default = 1
    convenience init(rgb red: UInt8, _ green: UInt8, _ blue: UInt8, alpha: CGFloat = 1) {
        let r = CGFloat(red) / 255.0
        let g = CGFloat(green) / 255.0
        let b = CGFloat(blue) / 255.0
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

    /// Generate UIColor from Hex. Adapted from Tom (http://stackoverflow.com/users/426478/tom) and Marcus Adam's (http://stackoverflow.com/users/168493/marcus-adams) Stack Overflow answer http://stackoverflow.com/a/3532264/4092717
    ///
    /// - Parameters:
    ///   - hex: Int (change # to 0x)
    ///   - alpha: Double, default = 1
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255
        let green = CGFloat((hex & 0xFF00) >> 8) / 255
        let blue = CGFloat((hex & 0xFF)) / 255
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}
