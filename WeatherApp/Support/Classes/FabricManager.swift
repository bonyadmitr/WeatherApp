//
//  FabricManager.swift
//  WeatherApp
//
//  Created by Bondar Yaroslav on 19/06/2017.
//  Copyright © 2017 Bondar Yaroslav. All rights reserved.
//

import Fabric
import Crashlytics

final class FabricManager: NSObject {
    
    func startCrashlytics() {
        Crashlytics.sharedInstance().delegate = self
        Fabric.sharedSDK().debug = true
        Fabric.with([Crashlytics.self, Answers.self])
        
        logUser()
        setKeys()
        
        /// will not show up in the system.log
        CLSLogv("Log awesomeness 10 %d %d %@", getVaList([1, 2, "three"]))
        var q = 10
        q += 1
        CLSLogv("Log awesomeness 20 %d", getVaList([q]))
        
        CLSLogv("qqqq", "wwww", "eeeee")
    }
    
    func write(string: String) {
        CLSLogv("%@", getVaList([string]))
    }
    
    func logUser() {
        Crashlytics.sharedInstance().setUserEmail("user@fabric.io")
        Crashlytics.sharedInstance().setUserIdentifier("12345")
        Crashlytics.sharedInstance().setUserName("Test User")
    }
    
    func setKeys() {
        Crashlytics.sharedInstance().setIntValue(42, forKey: "MeaningOfLife")
        Crashlytics.sharedInstance().setObjectValue("Test value", forKey: "last_UI_action")
    }
    
    func customMethod() {
        Answers.logCustomEvent(withName: "custom method", customAttributes: ["qwe": "123"])
    }
    
    func log(searchText: String?) {
        guard let text = searchText, text.notEmpty else { return }
        Answers.logSearch(withQuery: text, customAttributes: [:])
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
    var res = ""
    for _ in 0..<strings.count {
        res += "%@ "
    }
    CLSLogv(res, getVaList(strings))
}
