// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable file_length
// swiftlint:disable line_length

// swiftlint:disable type_body_length
enum L10n {
  /// All
  case all
  /// Bold
  case bold
  /// Cancel
  case cancel
  /// Colors
  case colors
  /// Default
  case `default`
  /// Fonts
  case fonts
  /// Light
  case light
  /// Enter new city
  case newCity
  /// Not found
  case notFound
  /// Regular
  case regular
  /// Search
  case search
  /// Select color
  case selectColor
  /// Select font
  case selectFont
  /// Select language
  case selectLanguage
  /// Settings
  case settings
  /// Weather App
  case weatherApp
}
// swiftlint:enable type_body_length

extension L10n: CustomStringConvertible {
  var description: String { return self.string }

  var string: String {
    switch self {
      case .all:
        return L10n.tr(key: "all")
      case .bold:
        return L10n.tr(key: "bold")
      case .cancel:
        return L10n.tr(key: "cancel")
      case .colors:
        return L10n.tr(key: "colors")
      case .`default`:
        return L10n.tr(key: "default")
      case .fonts:
        return L10n.tr(key: "fonts")
      case .light:
        return L10n.tr(key: "light")
      case .newCity:
        return L10n.tr(key: "new_city")
      case .notFound:
        return L10n.tr(key: "not_found")
      case .regular:
        return L10n.tr(key: "regular")
      case .search:
        return L10n.tr(key: "search")
      case .selectColor:
        return L10n.tr(key: "select_color")
      case .selectFont:
        return L10n.tr(key: "select_font")
      case .selectLanguage:
        return L10n.tr(key: "select_language")
      case .settings:
        return L10n.tr(key: "settings")
      case .weatherApp:
        return L10n.tr(key: "weather_app")
    }
  }

  private static func tr(key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

func tr(_ key: L10n) -> String {
  return key.string
}

private final class BundleToken {}
