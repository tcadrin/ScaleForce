//
//  CTAButton.swift
//  ScaleForce
//
//  Created by Jason Clark on 8/14/17.
//
//

import Swiftilities
import Anchorage
import BonMot
import MaterialComponents

class CTAButton: UIButton, ShadowedView {

    enum Constant {
        static let elevation = (
            normal: CGFloat(0),
            highlighted: CGFloat(3)
        )

        static let height = CGFloat(50)
    }

    var title: String? {
        set {
            styledText = newValue?.localizedUppercase
        }
        get {
            return styledText
        }
    }

    override var isHighlighted: Bool {
        didSet {
            elevation = isHighlighted ? Constant.elevation.highlighted : Constant.elevation.normal
        }
    }

    override class var layerClass: AnyClass {
        return MDCShadowLayer.self
    }

    var ink: MDCInkTouchController!

    init(title: String? = nil) {
        super.init(frame: .zero)
        backgroundColor = Color.cta.backgroundPrimary
        heightAnchor == Constant.height
        cornerRadius = Constant.height / 2
        bonMotStyle = {
            var style: StringStyle = .headline
            style.color = Color.cta.foreground
            return style
        }()
        styledText = title?.localizedUppercase
        ink = MDCInkTouchController(view: self)
        ink.addInkView()
        ink.defaultInkView.layer.masksToBounds = true
        ink.defaultInkView.layer.cornerRadius = Constant.height / 2
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
