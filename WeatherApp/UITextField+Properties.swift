//
//  UITextField+Properties.swift
//  OLPortal
//
//  Created by Bondar Yaroslav on 24/03/2017.
//  Copyright © 2017 sMediaLink. All rights reserved.
//

import UIKit

extension UITextField {
    
    private struct AssociatedKey {
        static var placeholderColor = "viewExtension"
    }
    
    /// Placeholder color
    @IBInspectable var placeholderColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.placeholderColor) as? UIColor
        }
        
        set {
            guard let value = newValue else { return }
            objc_setAssociatedObject(self, &AssociatedKey.placeholderColor, value, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            let att: [String : Any] = [NSForegroundColorAttributeName: value,
                                       NSFontAttributeName: font!]
            attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: att)
        }
    }
}
