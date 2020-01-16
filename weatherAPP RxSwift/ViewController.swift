//
//  ViewController.swift
//  weatherAPP RxSwift
//
//  Created by 矢守叡 on 2020/01/16.
//  Copyright © 2020 yamolean. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class ViewController: UIViewController {

    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //更新されたテキストフィールドの値を受け取る,リターンキーをタップ後はeditingDidEndOnExit
        //rx.value.asobservable()
        self.cityTextField.rx.controlEvent(.editingChanged)
            .asObservable()
            //更新されて空なら
            .map { self.cityTextField.text }
            //onNextで更新された値を流す,print("\(city)")はOptional("Tokyo")
            .subscribe(onNext: { city in
                if let city = city {
                    if city.isEmpty {
                        //大幅削除1
                        //空の際は”入れて"って出す
                        //self.displayWeather(nil)
                        
                        self.temperatureLabel.text = "都市入れて"
                        self.humidityLabel.text = "都市入れて"
                    } else {
                        //入力された値(Tokyo)を入れてURLリクエストをする
                        self.fetchWeather(by: city)
                    }
                }
            }).disposed(by: disposeBag)//subscribe解除
    }
    
    private func fetchWeather(by city: String) {
        //都市名を引数に入れてURLを作る
        guard let url = URL.urlForWeatherAPI(city: city) else { return }
        //Resource<T>型
        let resource = Resource<WeatherResult>(url: url)
        
        //URLリクエストをします
        let search = URLRequest.load(resource: resource)
            //メインスレッドで動く
            .observeOn(MainScheduler.instance)
            //errorが流れるとerrorを引数で渡した値のnextイベントに変換,completeを自動で流し,Observableを終了
            //大幅削除2で削除
            //.catchErrorJustReturn(WeatherResult.empty)
        
        //エラー無視
        .asDriver(onErrorJustReturn: WeatherResult.empty)
        
        //searchはWeatherResult型,mapで変換して,bindでviewに反映
        //大幅削除1で追加
        //大幅削除2で削除
        search.map { "気温\($0.main.temp)度" }
//            .bind(to: self.temperatureLabel.rx.text)
            .drive(self.temperatureLabel.rx.text)
            .disposed(by: disposeBag)

        search.map { "湿度\($0.main.humidity)度" }
//            .bind(to: self.humidityLabel.rx.text)
            .drive(self.humidityLabel.rx.text)
            .disposed(by: disposeBag)
        
        //大幅削除1
//        URLRequest.load(resource: resource)
//            .observeOn(MainScheduler.instance)
//            .catchErrorJustReturn(WeatherResult.empty)
            //resultはWeatherResult型,
            //WeatherResult(main: weatherAPP_RxSwift.Weather(temp: 6.96, humidity: 93.0))
//            .subscribe(onNext: { result in
//                //Weather型にパース
//                let weather = result.main
//                self.displayWeather(weather)
//            }).disposed(by: disposeBag)//subscribe解除
    }
    
    //大幅削除1
    //引数はWether型
//    private func displayWeather(_ weather: Weather?) {
//        if let weather = weather {
            //Weather型の引数をパースしてviewに反映
//            self.temperatureLabel.text = "\(weather.temp)わわ"
//            self.humidityLabel.text = "\(weather.humidity)"
//        } else {
//            //テキストフィールドが空の場合
//            self.temperatureLabel.text = "都市入れて"
//            self.humidityLabel.text = "都市入れて"
//        }
//    }
}

