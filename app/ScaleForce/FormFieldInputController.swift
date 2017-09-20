//
//  FormFieldInputController.swift
//  ScaleForce
//
//  Created by Jason Clark on 8/15/17.
//
//

import FrictionLess
import MaterialComponents.MDCTextInputControllerDefault
import BonMot

final class FormFieldInputController: MDCTextInputControllerDefault {

    var tintColor: UIColor {
        return Color.formField.tint
    }

    func floatingPlaceholderColor(_ state: FormComponentState) -> UIColor {
        if case .valid = state {
            return Color.formField.valid
        }
        else {
            return Color.formField.tint
        }
    }

    func normalColor(_ state: FormComponentState) -> UIColor {
        if case .valid = state {
            return Color.formField.valid
        }
        else {
            return Color.formField.underlineInactive
        }
    }

    func activeColor(_ state: FormComponentState) -> UIColor {
        if case .valid = state {
            return Color.formField.valid
        }
        else {
            return Color.formField.tint
        }
    }

    func leadingUnderlineLabelAlpha(_ state: FormComponentState) -> CGFloat {
        switch state {
        case .invalid:  return 1.0
        default:        return 0.5
        }
    }

    func update() {
        guard let textField = textInput as? FormField else { return }
        let state = textField.formState

        inlinePlaceholderColor = Color.formField.placeholder
        floatingPlaceholderColor = floatingPlaceholderColor(state)
        normalColor = normalColor(state)
        activeColor = activeColor(state)
        errorColor = Color.formField.error
        textField.placeholderLabel.font = StringStyle.callout.font
        textField.font = StringStyle.callout.font
        textField.textColor = Color.formField.text
        textField.leadingUnderlineLabel.font = StringStyle.caption2.font
        textField.leadingUnderlineLabel.alpha = leadingUnderlineLabelAlpha(state)
        textField.rightView?.tintColor = normalColor(.inactive)
    }

}
