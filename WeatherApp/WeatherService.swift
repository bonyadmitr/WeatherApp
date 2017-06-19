//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Bondar Yaroslav on 29/04/2017.
//  Copyright © 2017 Bondar Yaroslav. All rights reserved.
//

import PromiseKit
import Alamofire

///WeatherRemote
class WeatherService {
    
    static let shared = WeatherService()
    
    private func params(for text: String) -> [String: Any] {
        return ["units": "metric",
                "APPID": URLs.wetherKey,
                "q": text]
    }
    
    func current(for text: String) -> Promise<WeatherCurrent> {
        return request(URLs.wetherApi +/ "weather", parameters: params(for: text))
            .validate()
            .responseObject()
    }
    
    func forecast(for text: String) -> Promise<WeatherForecastResult> {
//        let q = WeatherForecastResult()
//        q.list = [WeatherForecast()]
//        return Promise(value: q)
        return request(URLs.wetherApi +/ "forecast", parameters: params(for: text))
            .validate()
            .responseObject()
    }
}
