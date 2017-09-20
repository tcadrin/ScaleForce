//
//  FormField.swift
//  ScaleForce
//
//  Created by Jason Clark on 8/14/17.
//
//

import FrictionLess
import MaterialComponents
import Anchorage

class FormField: FormattableTextField {

    static let defaultPadding = CGFloat(-9)
    static let height = CGFloat(80) //TODO dynamically generated

    var inputController: FormFieldInputController!

    override init(formatter: TextFieldFormatter? = nil) {
        super.init(formatter: formatter)
        inputController = FormFieldInputController(textInput: self)
        heightAnchor == FormField.height
    }

    override var tintColor: UIColor! {
        //MDCTextField gobbles up the tint color for the cursor :(
        set { super.tintColor = inputController?.tintColor ?? newValue }
        get { return super.tintColor }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var isEnabled: Bool {
        didSet {
            isUserInteractionEnabled = isEnabled
        }
    }

    var formState: FormComponentState = .inactive {
        didSet {
            switch formState {
            case .active:
                inputController.setErrorText(nil, errorAccessibilityValue: nil)
            case .inactive:
                inputController.setErrorText(nil, errorAccessibilityValue: nil)
            case .invalid(errorString: let error):
                inputController.setErrorText(error ?? inputController.helperText ?? "", errorAccessibilityValue: error)
            case .valid:
                inputController.setErrorText(nil, errorAccessibilityValue: nil)
            }

            inputController.update()
        }
    }

    var value: String {
        get {
            return unformattedText
        }
        set {
            if newValue != unformattedText {
                setTextAndFormat(text: newValue)
            }
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        inputController?.update()
    }

}
