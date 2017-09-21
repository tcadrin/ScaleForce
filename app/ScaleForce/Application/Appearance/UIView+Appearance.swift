//
//  UIView+Appearance.swift
//  ScaleForce
//
//  Created by Jason Clark on 8/11/17.
//
//

import Foundation

extension UIView {

    dynamic var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue }
        get { return layer.cornerRadius }
    }

    dynamic var borderColor: UIColor? {
        set { layer.borderColor = newValue?.cgColor }
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
    }

    dynamic var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { return layer.borderWidth }
    }

}
