//
//  ShadowViews.swift
//  ScaleForce
//
//  Created by Jason Clark on 4/20/17.
//
//

import MaterialComponents

protocol ShadowedView: class {
    var elevation: CGFloat { get set }
}

extension ShadowedView where Self: UIView {

    var shadowLayer: MDCShadowLayer {
        // swiftlint:disable force_cast
        return self.layer as! MDCShadowLayer
    }

    var elevation: CGFloat {
        set { shadowLayer.elevation = newValue }
        get { return shadowLayer.elevation }
    }

}

class ShadowView: UIView, ShadowedView {

    dynamic var elevation: CGFloat {
        set { shadowLayer.elevation = newValue }
        get { return shadowLayer.elevation }
    }

    override class var layerClass: AnyClass { return MDCShadowLayer.self }
}

class ShadowCollectionViewCell: UICollectionViewCell, ShadowedView {

    dynamic var elevation: CGFloat {
        set { shadowLayer.elevation = newValue }
        get { return shadowLayer.elevation }
    }

    override class var layerClass: AnyClass { return MDCShadowLayer.self }
}
