//
//  Weather.swift
//  WeatherBrick
//
//  Created by Дмитрий Фетюхин on 01.02.2022.
//  Copyright © 2022 VAndrJ. All rights reserved.
//

import Foundation

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
    
    func updateWeatherInfo(latitude: Double, longtitude: Double, completion: (() -> Void)? = nil) {
        let session = URLSession.shared
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?lat=\(latitude.description)&lon=\(longtitude.description)&units=metric&appid=02dd91fbf1b01a29b1b1a226c644bed9")!
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("DataTask error: \(error!.localizedDescription)")
                self.noInternet = true
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
