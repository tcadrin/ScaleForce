//
//  FormField+lookup.swift
//  ScaleForce
//
//  Created by Jason Clark on 8/14/17.
//
//

import Foundation

extension FormField {

    var siblings: [FormField] {
        return superestView?.lookupSortedViews() ?? []
    }

    var fieldAfter: FormField? {
        let fields = siblings
        guard let idx = fields.index(of: self), self != fields.last else { return nil }
        return fields[idx + 1]
    }

    var fieldBefore: FormField? {
        let fields = siblings
        guard let idx = fields.index(of: self), idx > fields.startIndex else { return nil }
        return fields[idx - 1]
    }

    private var superestView: UIView? {
        var parent: UIView? = superview
        while parent?.superview != nil {
            parent = parent?.superview
        }
        return parent
    }

}
