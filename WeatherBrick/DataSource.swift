//
//  DataSource.swift
//  WeatherBrick
//
//  Created by Дмитрий Фетюхин on 10.01.2022.
//  Copyright © 2022 VAndrJ. All rights reserved.
//

import Foundation

struct DataSource {
    static let brickImageNameByWeatherStatus: [String: String] = [
        "Thunderstorm": "image_stone_wet",
        "Drizzle": "image_stone_wet",
        "Rain": "image_stone_wet",
        "Snow": "image_stone_snow",
        "Atmosphere": "image_stone_normal",
        "Clear": "image_stone_normal",
        "Clouds": "image_stone_normal"
    ]
    
    enum BrickState: String {
        case raining = "Brick is wet - raining",
        sunny = "Brick is dry - sunny",
        fog = "Brick is hard to see - fog",
        hot = "Brick with cracks - very hot",
        snow = "Brick with snow - snow",
        windy = "Brick is swinging - windy",
        undefined = "Brick is gone - No internet"
    }
}
