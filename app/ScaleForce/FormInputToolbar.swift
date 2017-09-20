//
//  FormInputToolbar.swift
//  ScaleForce
//
//  Created by Jason Clark on 4/24/17.
//
//

import Foundation

class FormInputToolbar: UIToolbar {

    static var leftImage = Asset.keyboardLeftArrow.image
    static var rightImage = Asset.keyboardRightArrow.image

    enum Constants {
        static let padding = CGFloat(50)
    }

    fileprivate var left: UIBarButtonItem!
    fileprivate var right: UIBarButtonItem!
    fileprivate var done: UIBarButtonItem!

    let textFields: [UITextField]

    init(textFields: [UITextField]) {
        self.textFields = textFields
        //needs a non-.zero rect to render toolbar background
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 44))

        left = UIBarButtonItem(image: FormInputToolbar.leftImage,
                               style: .plain,
                               target: self,
                               action: #selector(leftButtonPressed))

        right = UIBarButtonItem(image: FormInputToolbar.rightImage,
                                style: .plain,
                                target: self,
                                action: #selector(rightButtonPressed))

        let fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        fixedSpace.width = Constants.padding

        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        done = UIBarButtonItem(barButtonSystemItem: .done,
                               target: self,
                               action: #selector(doneButtonPressed))

        items = [left, fixedSpace, right, flexibleSpace, done]

        textFields.forEach { textField in
            textField.inputAccessoryView = self
            textField.addTarget(self, action: #selector(didBecomeFirstResponder(control:)), for: .editingDidBegin)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

fileprivate extension FormInputToolbar {

    @objc func didBecomeFirstResponder(control: UIControl) {
        let interactive = textFields.filter { $0.isUserInteractionEnabled }
        if let first = interactive.first, let last = interactive.last {
            left.isEnabled = control != first
            right.isEnabled = control != last
        }
    }

    @objc func leftButtonPressed() {
        if let index = textFields.index(where: { $0.isFirstResponder }), index > textFields.startIndex {
            let before = textFields.index(before: index)
            let control = textFields[before]
            control.becomeFirstResponder()
        }
    }

    @objc func rightButtonPressed() {
        if let index = textFields.index(where: { $0.isFirstResponder }), index < textFields.endIndex {
            let after = textFields.index(after: index)
            let control = textFields[after]
            control.becomeFirstResponder()
        }
    }

    @objc func doneButtonPressed() {
        textFields.first(where: { $0.isFirstResponder })?.resignFirstResponder()
    }

}
