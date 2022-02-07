//
//  Constants.swift
//  WeatherBrick
//
//  Created by Дмитрий Фетюхин on 05.02.2022.
//  Copyright © 2022 VAndrJ. All rights reserved.
//

import Foundation

enum Constants {
    static var highestPointOfNormalTemperature: Double {
        return 19.9
    }
    static var highestPointOfNormalWind: Double {
        return 7.9
    }
    static func urlForWeatherAt(latitude: Double, longtitude: Double) -> URL {
        print(latitude.description)
        print(longtitude.description)
        return URL(string: "http://api.openweathermap.org/data/2.5/weather?lat=\(latitude.description)&lon=\(longtitude.description)&units=metric&appid=02dd91fbf1b01a29b1b1a226c644bed9")!
        }
}
