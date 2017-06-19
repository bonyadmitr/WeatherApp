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
    
    // TODO: Localize
    var name: String {
//        switch self {
//        case .all:
//            
//        default:
//            <#code#>
//        }
        return String(describing: self).capitalized
    }
    var description: String {
        return String(reflecting: self)
    }
}
