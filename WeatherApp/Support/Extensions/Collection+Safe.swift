//
//  Collection+Safe.swift
//  WeatherApp
//
//  Created by Bondar Yaroslav on 26/06/2017.
//  Copyright © 2017 Bondar Yaroslav. All rights reserved.
//

import Foundation

extension Collection where Indices.Iterator.Element == Index {
    
    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Generator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
