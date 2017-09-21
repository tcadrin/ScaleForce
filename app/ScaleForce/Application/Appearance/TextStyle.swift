//
//  TextStyle.swift
//  ScaleForce
//
//  Created by Jay Clark on 11/1/16.
//  Copyright © 2017 LongTime. All rights reserved.
//

import Foundation
import BonMot
import MaterialComponents

extension StringStyle {

    static let title1: StringStyle = {
        var style = StringStyle()
        style.font = Font.Sofia.Soft.bold(28)
        style.adaptations = [.control]
        return style
    }()

    static let title2: StringStyle = {
        var style = StringStyle()
        style.font = Font.Sofia.Soft.bold(24)
        style.color = Color.text.title
        style.adaptations = [.control]
        return style
    }()

    static let title3: StringStyle = {
        var style = StringStyle()
        style.font = Font.Sofia.Soft.regular(20)
        style.color = Color.text.title
        style.adaptations = [.control]
        return style
    }()

    static let headline: StringStyle = {
        var style = StringStyle()
        style.font = Font.Sofia.Soft.bold(17)
        style.adaptations = [.control]
        return style
    }()

    static let body: StringStyle = {
        var style = StringStyle()
        style.font = Font.Sofia.Soft.regular(17)
        style.color = Color.text.body
        style.lineHeightMultiple = 21.0/17.0
        style.adaptations = [.body]
        return style
    }()

    static let callout: StringStyle = {
        var style = StringStyle()
        style.font = Font.Sofia.Soft.regular(16)
        style.adaptations = [.body]
        return style
    }()

    static let subhead: StringStyle = {
        var style = StringStyle()
        style.font = Font.Sofia.Soft.regular(15)
        style.adaptations = [.control]
        return style
    }()

    static let footnote: StringStyle = {
        var style = StringStyle()
        style.font = Font.Sofia.Soft.regular(13)
        style.adaptations = [.control]
        return style
    }()

    static let caption1: StringStyle = {
        var style = StringStyle()
        style.font = Font.Sofia.Soft.regular(12)
        style.adaptations = [.control]
        return style
    }()

    static let caption2: StringStyle = {
        var style = StringStyle()
        style.font = Font.Sofia.Soft.regular(11)
        style.adaptations = [.control]
        return style
    }()

}

private enum Font {

    enum Sofia {
        enum Soft {

            static func regular(_ size: CGFloat) -> UIFont {
                return UIFont.systemFont(ofSize: size)
            }

            static func bold(_ size: CGFloat) -> UIFont {
                return UIFont.systemFont(ofSize: size)
            }

        }
    }

}
