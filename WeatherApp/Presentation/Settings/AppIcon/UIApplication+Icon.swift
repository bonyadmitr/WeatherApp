//
//  UIApplication+Icon.swift
//  AlternateIcon
//
//  Created by Bondar Yaroslav on 13/04/2017.
//  Copyright © 2017 Bondar Yaroslav. All rights reserved.
//

import UIKit

extension UIApplication {
    var mainAppIcon: UIImage? {
        guard
            let bundleIcons = Bundle.main.infoDictionary?["CFBundleIcons"] as? [String: Any],
            let prima‌​ryIcon = bundleIcons["CFBundlePrimaryIcon"] as? [String: Any],
            let iconsArray = prima‌​ryIcon["CFBundleIconFiles"] as? [String],
            let name = iconsArray.first
            else { return nil }
        return UIImage(named: name)
    }
}
