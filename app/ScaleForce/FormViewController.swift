//
//  FormViewController.swift
//  ScaleForce
//
//  Created by Jason Clark on 8/17/17.
//
//

import FrictionLess
import Swiftilities
import Anchorage

protocol FormView {
    var formFields: [FormField] { get }
}

class FormViewController<T: UIView>: UIViewController, FormattableTextFieldDelegate where T: FormView {

    var formView: T = T.init()

    let scrollView = UIScrollView()

    // optionally include another subview to avoid the keyboard, such as a CTA
    var auxillaryKeyboardAvoidingSubview: UIView?

    fileprivate var inputToolbar: FormInputToolbar!
    fileprivate var heightConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
        scrollView.edgeAnchors == view.edgeAnchors
        scrollView.addSubview(formView)
        formView.verticalAnchors == scrollView.verticalAnchors
        formView.horizontalAnchors == view.horizontalAnchors
        heightConstraint = formView.heightAnchor >= view.heightAnchor

        formView.formFields.forEach { $0.delegate = self }
        inputToolbar = FormInputToolbar(textFields: formView.formFields)

        scrollView.preservesSuperviewLayoutMargins = true
        formView.preservesSuperviewLayoutMargins = true

        configureKeyboard()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.backgroundColor = formView.backgroundColor
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateForm()
    }

// MARK: - API

    func updateForm() {
        formView.formFields.forEach { field in
            switch field.validation {
            case .valid where field.hasText:
                field.formState = .valid
            case .invalid where field.isFirstResponder:
                field.formState = .active
            case .invalid(let error) where field.hasText:
                let message = errorMessage(field: field, error: error)
                field.formState = .invalid(errorString: message)
            default: break
            }
        }
    }

    /// force validation on all components and set to either invalid or valid
    func forceValidate() {
        formView.formFields.forEach { field in
            switch field.validation {
            case .valid:
                field.formState = field.hasText ? .valid : .inactive
            case .invalid(let error):
                let message = errorMessage(field: field, error: error)
                field.formState = .invalid(errorString: message)
                field.shake()
            }
        }
    }

    //TODO: default error message
    func errorMessage(field: FormField, error: Error) -> String? {
        return nil
    }

// MARK: - FormattableTextFieldDelegate

    func editingChanged(textField: FormattableTextField) {
        //TODO: Consuming VM should validate
        if textField.isComplete && !formView.formFields.contains { !$0.isValid } {
            textField.resignFirstResponder()
        }
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let textField = textField as? FormField,
            textField.formState == .inactive else { return }
        textField.formState = .active
    }

    func textField(_ textField: FormattableTextField, didOverflowInput string: String) {
        //No Op.
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }

    func textFieldShouldNavigateBackwards(_ textField: FormattableTextField) {
        guard let previous = (textField as? FormField)?.fieldBefore else { return }
        previous.becomeFirstResponder()
    }

    func textField(_ textField: FormattableTextField, invalidInput error: Error) {
        if case FormattableTextFieldError.invalidInput = error {
            //input invalid digit. Shake, but do not outline.
            textField.shakeIfFirstResponder()
        }
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        guard let textField = textField as? FormField else {
            fatalError()
        }

        if case .invalid(let error) = textField.validation {
            if !textField.hasText {
                textField.formState = .inactive
            }
            else {
                let message = errorMessage(field: textField, error: error)
                textField.formState = .invalid(errorString: message)
                textField.shake()
            }
        }

        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let next = (textField as? FormField)?.fieldAfter,
            next.becomeFirstResponder() else {
                textField.resignFirstResponder()
                return false
        }
        return false
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        //mitigates a strange UITextfield animation on -resignFirstResponder
        //http://stackoverflow.com/a/32996549
        textField.layoutIfNeeded()
    }

// MARK: - Keyboard Avoiding

    fileprivate func configureKeyboard() {
        scrollView.keyboardDismissMode = .interactive

        Keyboard.addFrameObserver(self) { keyboardFrame in
            let offset = self.view.bounds.height - self.view.convert(keyboardFrame.origin, from: UIScreen.main.coordinateSpace).y
            scrollView.contentInset.bottom = offset
            scrollView.scrollIndicatorInsets.bottom = offset
            heightConstraint?.constant = -offset

            if !formView.frame.isEmpty {
                view.layoutIfNeeded()

                if let activeView = formView.formFields.first(where: { $0.isFirstResponder }) {
                    var activerect = scrollView.convert(activeView.bounds, from: activeView)

                    if let auxView = auxillaryKeyboardAvoidingSubview {
                        let auxRect = scrollView.convert(auxView.bounds, from: auxView)
                        activerect = activerect.union(auxRect)
                    }

                    let padded = activerect.insetBy(dx: 0, dy: -20)
                    scrollView.contentSize.width = view.bounds.width
                    scrollView.scrollRectToVisible(padded, animated: false)
                }
            }
        }
    }

}
