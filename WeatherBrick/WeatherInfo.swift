//
//  Weather.swift
//  WeatherBrick
//
//  Created by Дмитрий Фетюхин on 01.02.2022.
//  Copyright © 2022 VAndrJ. All rights reserved.
//

import Foundation
import UIKit

class WeatherInfo {
    var weatherData = WeatherData()
    
    static var _sharedInstance: WeatherInfo?
    class func sharedInstance() -> WeatherInfo {
        if _sharedInstance == nil {
            _sharedInstance = WeatherInfo()
        }
        return _sharedInstance!
    }
    
    var noInternet = false
    
    lazy var cityAndCountry = "\(weatherData.name), \(weatherData.sys.fullCountryName ?? "")"
    lazy var status = weatherData.weather[0].main
    lazy var temperature = weatherData.main.temp
    lazy var stringTemperature = Int(temperature).description + "°"
    lazy var windSpeed = weatherData.wind.speed
    var image: UIImage {
        if temperature > Constants.highestPointOfNormalTemperature {
            return UIImage(named: "image_stone_cracks")!
        }
        return UIImage(named: DataSource.brickImageNameByWeatherStatus[status]!)!
    }
    
    func updateWeatherInfo(latitude: Double, longtitude: Double, completion: (() -> Void)? = nil) {
        let session = URLSession.shared
        let url = Constants.urlForWeatherAt(latitude: latitude, longtitude: longtitude)
        print(url)
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("DataTask error: \(error!.localizedDescription)")
                self.noInternet = true
                self.status = "noStatus"
                self.temperature = 999.0
                self.windSpeed = 999.0
                completion?()
                return
            }
            do {
                self.weatherData = try JSONDecoder().decode(WeatherData.self, from: data!)
                DispatchQueue.main.async {
                    completion?()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
