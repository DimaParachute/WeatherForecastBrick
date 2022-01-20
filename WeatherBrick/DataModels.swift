//
//  DataModels.swift
//  WeatherBrick
//
//  Created by Дмитрий Фетюхин on 09.01.2022.
//  Copyright © 2022 VAndrJ. All rights reserved.
//

import Foundation

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct Main: Codable {
    var temp: Double = 0.0
    var pressure: Int = 0
    var humidity: Int = 0
}

struct Sys: Codable {
    var country: String = ""
    var fullCountryName: String? {
        let current = Locale(identifier: "en-US")
        return current.localizedString(forRegionCode: country)
    }
}

struct Wind: Codable {
    var speed: Double = 0.0
}

struct WeatherData: Codable {
    var weather: [Weather] = []
    var main: Main = Main()
    var sys: Sys = Sys()
    var name: String = ""
    var wind: Wind = Wind()
}
