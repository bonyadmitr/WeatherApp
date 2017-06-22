//
//  FabricManager.swift
//  WeatherApp
//
//  Created by Bondar Yaroslav on 19/06/2017.
//  Copyright © 2017 Bondar Yaroslav. All rights reserved.
//

import Fabric
import Crashlytics
import UIKit

final class FabricManager: NSObject {
    
    func startCrashlytics() {
        Crashlytics.sharedInstance().delegate = self
        Fabric.sharedSDK().debug = false
        Fabric.with([Crashlytics.self, Answers.self])
        
        logUser()
        logForCrash()
        setKeysForCrash()
    }
    
    /// logging that will be sent with your crash data
    /// will not show up in the system.log
    func logForCrash() {
        CLSLogv("Log awesomeness 10 %d %d %@", getVaList([1, 2, "three"]))
        CLSLogv("qqqq", "wwww", "eeeee")
    }
    
    func logUser() {
        Crashlytics.sharedInstance().setUserEmail("user@fabric.io")
        Crashlytics.sharedInstance().setUserIdentifier("12345")
        Crashlytics.sharedInstance().setUserName("Test User")
    }
    
    func setKeysForCrash() {
        Crashlytics.sharedInstance().setIntValue(42, forKey: "MeaningOfLife")
        Crashlytics.sharedInstance().setObjectValue("Test value", forKey: "last_UI_action")
    }
    
    func logSettings() {
        Answers.logCustomEvent(withName: "press settings")
    }
    
    func log(searchText: String?) {
        guard let text = searchText, text.notEmpty else { return }
        Answers.logSearch(withQuery: text, customAttributes: [:])
    }
    
    func log(fontName: String) {
        Answers.logCustomEvent(withName: "selected font", customAttributes: ["fontName": fontName])
    }
    
    func log(color: UIColor) {
        Answers.logCustomEvent(withName: "selected color", customAttributes: ["color": String(describing: color)])
    }
    
    func log(cityName: String) {
        Answers.logCustomEvent(withName: "selected city", customAttributes: ["city": cityName])
    }
    
    func log(language: String) {
        Answers.logCustomEvent(withName: "selected language", customAttributes: ["language": language])
    }
    
    func log(appIcon: AppIcon) {
        Answers.logCustomEvent(withName: "selected app icon", customAttributes: ["icon": appIcon.name ?? "main"])
    }
}
extension FabricManager: CrashlyticsDelegate {
    func crashlyticsDidDetectReport(forLastExecution report: CLSReport, completionHandler: @escaping (Bool) -> Void) {
        print("report: ", report)
        completionHandler(true)
    }
}
extension FabricManager {
    @nonobjc static let shared = FabricManager()
}

private func CLSLogv(_ strings: String...) {
    // need to test
    let res = String(repeating: "%@ ", count: strings.count)
//    var res = ""
//    for _ in 0..<strings.count {
//        res += "%@ "
//    }
    CLSLogv(res, getVaList(strings))
}
