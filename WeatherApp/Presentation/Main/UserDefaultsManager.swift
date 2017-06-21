//
//  UserDefaultsManager.swift
//  WeatherApp
//
//  Created by Bondar Yaroslav on 16/06/2017.
//  Copyright © 2017 Bondar Yaroslav. All rights reserved.
//

import Foundation

final class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    private let placeKey = "placeKey"
    var place: Place {
        get {
            guard let data = UserDefaults.standard.object(forKey: placeKey) as? Data,
                let place = NSKeyedUnarchiver.unarchiveObject(with: data) as? Place
            else {
                return Place(city: "Moscow", country: "Russia", full: NSAttributedString())
            }
            return place
        }
        set {
            let data = NSKeyedArchiver.archivedData(withRootObject: newValue)
            UserDefaults.standard.set(data, forKey: placeKey)
        }
    }
}
