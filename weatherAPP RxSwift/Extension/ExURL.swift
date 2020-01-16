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
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?units=metric&APPID=69436863e43744551e544edd8804d8a8&q=\(city)")
    }
}
