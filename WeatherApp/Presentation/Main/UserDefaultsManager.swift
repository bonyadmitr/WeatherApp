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
    
    private let cityNameKey = "cityNameKey"
    var cityName: String {
        get { return UserDefaults.standard.string(forKey: cityNameKey) ?? "Moscow" }
        set { UserDefaults.standard.set(newValue, forKey: cityNameKey) }
    }
}
