//
//  SignInView.swift
//  ScaleForce
//
//  Created by Jason Clark on 9/20/17.
//
//

import Anchorage

final class SignInView: UIView {

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = nil
        imageView.backgroundColor = .orange
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let emailField: FormField = {
        let textField = FormField()
        textField.placeholder = Copy.Signin.email
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        return textField
    }()

    let passwordField: FormField = {
        let textField = FormField()
        textField.placeholder = Copy.Signin.password
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        return textField
    }()

    let signInButton = CTAButton(title: Copy.Signin.buttonTitle)

    init() {
        super.init(frame: .zero)
        configureView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension SignInView: FormView {

    var formFields: [FormField] {
        return [
            emailField,
            passwordField,
        ]
    }

}

private extension SignInView {

    enum Constant {
        static let Spacing = (
            image_form: CGFloat(40),
            form: FormField.defaultPadding,
            form_signIn: CGFloat(25),
            signIn_forgot: CGFloat(30)
        )

        static let imageHeight = CGFloat(200)
    }

    func configureView() {
        addSubview(imageView)
        imageView.topAnchor == layoutMarginsGuide.topAnchor
        imageView.horizontalAnchors == layoutMarginsGuide.horizontalAnchors
        imageView.heightAnchor == Constant.imageHeight

        let formStack = UIStackView(arrangedSubviews: formFields)
        formStack.axis = .vertical
        formStack.spacing = Constant.Spacing.form
        addSubview(formStack)
        formStack.topAnchor == imageView.bottomAnchor + Constant.Spacing.image_form
        formStack.horizontalAnchors == layoutMarginsGuide.horizontalAnchors

        addSubview(signInButton)
        signInButton.topAnchor == passwordField.bottomAnchor + Constant.Spacing.form_signIn
        signInButton.horizontalAnchors == layoutMarginsGuide.horizontalAnchors
        signInButton.bottomAnchor == layoutMarginsGuide.bottomAnchor
    }

}
