//
//  Color.swift
//  ScaleForce
//
//  Created by Jay Clark on 3/29/17.
//  Copyright © 2017 LongTime. All rights reserved.
//

struct Color {

    static let text = (
        title: Brand.blue,
        body: App.grayBrown,
        subtitle: App.subtitleGray,
        light: App.white,
        link: Brand.teal
    )

    static let cta = (
        foreground: App.softWhite,
        backgroundPrimary: Brand.green,
        backgroundSecondary: Brand.teal
    )

    static let formField = (
        placeholder: App.darkGray,
        text: App.darkText,
        underlineInactive: App.subtitleGray,
        tint: Brand.teal,
        error: App.invalidRed,
        valid: Brand.green.darkened(by: 0.1)
    )

}

private extension Color {

    static let Brand = (
        green:          #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) .hex(0x91B54D),
        blue:           #colorLiteral(red: 0.1764705882, green: 0.3411764706, blue: 0.5843137255, alpha: 1) .hex(0x2D5795),
        teal:           #colorLiteral(red: 0.3725490196, green: 0.7803921569, blue: 0.968627451, alpha: 1) .hex(0x5FC7F7),
        periwinkle:     #colorLiteral(red: 0.568627451, green: 0.6588235294, blue: 0.8156862745, alpha: 1) .hex(0x91A8D0),
        red:            #colorLiteral(red: 0.631372549, green: 0.1176470588, blue: 0.0862745098, alpha: 1) .hex(0xA11E16),
        orange:         #colorLiteral(red: 0.7921568627, green: 0.3450980392, blue: 0.02352941176, alpha: 1) .hex(0xca5806)
    )

    static let App = (
        darkText:       #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1) .hex(0x212121),
        darkGrayBlue:   #colorLiteral(red: 0.2235294118, green: 0.3137254902, blue: 0.3882352941, alpha: 1) .hex(0x395063),
        grayBrown:      #colorLiteral(red: 0.3450980392, green: 0.3490196078, blue: 0.3568627451, alpha: 1) .hex(0x58595B),
        darkGray:       #colorLiteral(red: 0.4588235294, green: 0.4588235294, blue: 0.4588235294, alpha: 1) .hex(0x757575),
        subtitleGray:   #colorLiteral(red: 0.5803921569, green: 0.5803921569, blue: 0.5803921569, alpha: 1) .hex(0x949494),
        hairline:       #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1) .hex(0xD8D8D8),
        softWhite:      #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1) .hex(0xF7F7F7),
        white:          #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) .hex(0xFFFFFF),

        invalidRed:     #colorLiteral(red: 1, green: 0, blue: 0.2, alpha: 1) .hex(0xFF0033)
    )
}

private extension UIColor {

    func hex(_ hex: Int, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(hex: hex, alpha: alpha)
    }
    
}
