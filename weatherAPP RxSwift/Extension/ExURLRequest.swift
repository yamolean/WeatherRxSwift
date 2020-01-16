//
//  ExURLRequest.swift
//  weatherAPP RxSwift
//
//  Created by 矢守叡 on 2020/01/16.
//  Copyright © 2020 yamolean. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

//struct WeatherResult: Decodable {
//    let main: Weather
//}
//
//extension WeatherResult {
//    static var empty: WeatherResult {
//        return WeatherResult(main: Weather(temp: 0.0 ,humidity: 0.0))
//    }
//}
//
//struct Weather: Decodable {
//    let temp: Double
//    let humidity: Double
//}

struct Resource<T> {
    let url: URL
}

extension URLRequest {
    static func load<T: Decodable>(resource: Resource<T>) -> Observable<T> {
        //urlがobservableに
        return Observable.from([resource.url])
            //非同期処理をつなげる
            .flatMap { url -> Observable<Data> in
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
        }.map { data -> T in //onNextで流れる値を変換
            return try JSONDecoder().decode(T.self, from: data)
        }.asObservable()
    }
}
