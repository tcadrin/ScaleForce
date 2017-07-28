// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation

// swiftlint:disable file_length
// swiftlint:disable line_length

// swiftlint:disable type_body_length
// swiftlint:disable nesting
// swiftlint:disable variable_name
// swiftlint:disable valid_docs
// swiftlint:disable type_name

enum Localized {

  enum Onboarding {

    enum Buttons {
      /// Join
      static let join = Localized.tr("Onboarding.Buttons.Join")
      /// Already have an account? Sign in.
      static let signIn = Localized.tr("Onboarding.Buttons.SignIn")
      /// Skip
      static let skip = Localized.tr("Onboarding.Buttons.Skip")
    }

    enum Pages {

      enum Sample {
        /// This is body copy for the onboarding and should be replaced with real text!
        static let body = Localized.tr("Onboarding.Pages.Sample.Body")
        /// HEADING TEXT
        static let heading = Localized.tr("Onboarding.Pages.Sample.Heading")
      }
    }
  }

  enum Title {
    /// ScaleForce
    static let navigation = Localized.tr("Title.Navigation")
  }
}

extension Localized {
  fileprivate static func tr(_ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}

// swiftlint:enable type_body_length
// swiftlint:enable nesting
// swiftlint:enable variable_name
// swiftlint:enable valid_docs
