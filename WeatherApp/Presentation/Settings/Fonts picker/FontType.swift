//
//  FontType.swift
//  WeatherApp
//
//  Created by Bondar Yaroslav on 18/06/2017.
//  Copyright © 2017 Bondar Yaroslav. All rights reserved.
//

import Foundation

enum FontType: Int {
    case all = 0
    case regular
    case light
    case bold
    
    /// old: String(describing: self).capitalized
    var name: String {
        switch self {
        case .all:
            return tr(.all)
        case .regular:
            return tr(.regular)
        case .light:
            return tr(.light)
        case .bold:
            return tr(.bold)
        }
    }
    
    var description: String {
        return String(reflecting: self)
    }
}
