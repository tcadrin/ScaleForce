//
//  SignInViewController.swift
//  ScaleForce
//
//  Created by Jason Clark on 8/14/17.
//
//

import Anchorage
import FrictionLess
import Swiftilities

final class SignInViewController: FormViewController<SignInView> {

    var viewModel = SignInViewModel() {
        didSet {
            formView.emailField.value = viewModel.email
            formView.passwordField.value = viewModel.password
            updateForm()
        }
    }

    enum Constant {
        static let layoutMargins =
            UIEdgeInsets(top: 20, left: 20, bottom: 25, right: 20)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        formView.emailField.formatter = viewModel.formatters.email
        formView.passwordField.formatter = viewModel.formatters.password

        formView.signInButton.addTarget(self, action: #selector(signInPressed), for: .primaryActionTriggered)

        auxillaryKeyboardAvoidingSubview = formView.signInButton

        formView.layoutMargins = Constant.layoutMargins

    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }

    override func errorMessage(field: FormField, error: Error) -> String? {
        switch error {
        case is EmailFormatterError:
            return "Enter a valid email"
        case is PasswordEntryFormatterError:
            return "Enter a valid password"
        default: return nil
        }
    }

    // MARK: - Actions

    @objc func signInPressed() {
        guard viewModel.isValid else {
            forceValidate()
            return
        }
    }

    // MARK: - FormattableTextFieldDelegate

    override func editingChanged(textField: FormattableTextField) {
        super.editingChanged(textField: textField)

        viewModel.update(
            email:      formView.emailField.value,
            password:   formView.passwordField.value
        )
    }

}
