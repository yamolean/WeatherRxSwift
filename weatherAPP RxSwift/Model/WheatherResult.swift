//
//  WheatherResult.swift
//  weatherAPP RxSwift
//
//  Created by 矢守叡 on 2020/01/16.
//  Copyright © 2020 yamolean. All rights reserved.
//
//{
//    "coord": {
//        "lon": 139.69,
//        "lat": 35.69
//    },
//    "weather": [
//        {
//            "id": 803,
//            "main": "Clouds",
//            "description": "broken clouds",
//            "icon": "04d"
//        }
//    ],
//    "base": "stations",
//    "main": {
//        "temp": 10.21,　ここここここここここここここここここここここここここここここここここここここここここここここここここここここここここここここここここここここここ
//        "feels_like": 6.55,
//        "temp_min": 7.78,
//        "temp_max": 12.78,
//        "pressure": 1020,
//        "humidity": 34　ここここここここここここここここここここここここここここここここここここここここここここここここここここここここここここここここここここここここ
//    },
//    "visibility": 10000,
//    "wind": {
//        "speed": 1.5,
//        "deg": 20
//    },
//    "clouds": {
//        "all": 75
//    },
//    "dt": 1579152002,
//    "sys": {
//        "type": 1,
//        "id": 8077,
//        "country": "JP",
//        "sunrise": 1579125016,
//        "sunset": 1579161035
//    },
//    "timezone": 32400,
//    "id": 1850144,
//    "name": "Tokyo",
//    "cod": 200
//}

import UIKit

struct WheatherResult: Decodable {
    let main: Wheather
}

struct Wheather {
    let temp: Double
    let humidity: Double
}
