//
//  ExURL.swift
//  weatherAPP RxSwift
//
//  Created by 矢守叡 on 2020/01/16.
//  Copyright © 2020 yamolean. All rights reserved.
//
//https://api.openweathermap.org/data/2.5/weather?units=metric&APPID=69436863e43744551e544edd8804d8a8&q=Tokyo

import Foundation

extension URL {
    static func urlForWeatherAPI(city: String) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.openweathermap.org"
        urlComponents.path = "/data/2.5/weather"
        urlComponents.queryItems = [
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "APPID", value: "69436863e43744551e544edd8804d8a8"),
            URLQueryItem(name: "q", value: city)
        ]
        return urlComponents.url
    }
}

