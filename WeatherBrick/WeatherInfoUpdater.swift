//
//  WeatherInfoUpdater.swift
//  WeatherBrick
//
//  Created by Дмитрий Фетюхин on 31.01.2022.
//  Copyright © 2022 VAndrJ. All rights reserved.
//

import Foundation

extension MainViewController {
    func updateWeatherInfo(latitude: Double, longtitude: Double) {
        weatherUpdatingActivityIndicator.isHidden = false
        weatherUpdatingActivityIndicator.startAnimating()
        let session = URLSession.shared
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?lat=\(latitude.description)&lon=\(longtitude.description)&units=metric&appid=02dd91fbf1b01a29b1b1a226c644bed9")!
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("DataTask error: \(error!.localizedDescription)")
                self.weatherBrickImageView.isHidden = true
                return
            }
            do {
                self.weatherData = try JSONDecoder().decode(WeatherData.self, from: data!)
                DispatchQueue.main.async {
                    self.updateView()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
