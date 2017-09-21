//
//  SignInViewModel.swift
//  ScaleForce
//
//  Created by Jason Clark on 8/14/17.
//
//

import FrictionLess

struct SignInViewModel {

    var email: String = ""
    var password: String = ""

    let formatters = (
        email: EmailFormatter(),
        password: PasswordEntryFormatter()
    )

    mutating func update(email: String,
                         password: String) {
        self.email = email
        self.password = password
    }

}

extension SignInViewModel {

    var isValid: Bool {
        return formatters.email.validate(email) == .valid
            && formatters.password.validate(password) == .valid
    }

}
