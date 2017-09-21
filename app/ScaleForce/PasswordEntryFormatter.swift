//
//  PasswordEntryFormatter.swift
//  ScaleForce
//
//  Created by Jason Clark on 8/16/17.
//
//

import FrictionLess

enum PasswordEntryFormatterError: Error {
    case empty
}

struct PasswordEntryFormatter: TextFieldFormatter {

    var minimumLength = 1

    func validate(_ text: String) -> ValidationResult {
        let length = text.characters.count
        if length < minimumLength {
            return .invalid(validationError: PasswordEntryFormatterError.empty)
        }
        else {
            return .valid
        }
    }

}
