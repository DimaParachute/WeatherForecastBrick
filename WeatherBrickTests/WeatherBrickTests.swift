//
//  Created by Volodymyr Andriienko on 11/3/21.
//  Copyright © 2021 VAndrJ. All rights reserved.
//

import XCTest
@testable import WeatherBrick

class WeatherBrickTests: XCTestCase {
    let weatherInfo = WeatherInfo.sharedInstance()
    
    func compareTestResults() {
        XCTAssertEqual(weatherInfo.cityAndCountry, "Moscow, Russia")
        XCTAssertNotEqual(weatherInfo.status, "noStatus")
        XCTAssertNotEqual(weatherInfo.temperature, 999.0)
        XCTAssertNotEqual(weatherInfo.windSpeed, 999.0)
        XCTAssertNotEqual(weatherInfo.stringTemperature, "999°")
        weatherInfo.status = "Thunderstorm"
        XCTAssertEqual(weatherInfo.image, UIImage(named: "image_stone_wet"))
        weatherInfo.status = "Drizzle"
        XCTAssertEqual(weatherInfo.image, UIImage(named: "image_stone_wet"))
        weatherInfo.status = "Rain"
        XCTAssertEqual(weatherInfo.image, UIImage(named: "image_stone_wet"))
        weatherInfo.status = "Snow"
        XCTAssertEqual(weatherInfo.image, UIImage(named: "image_stone_snow"))
        weatherInfo.status = "Atmosphere"
        XCTAssertEqual(weatherInfo.image, UIImage(named: "image_stone_normal"))
        weatherInfo.status = "Clear"
        XCTAssertEqual(weatherInfo.image, UIImage(named: "image_stone_normal"))
        weatherInfo.status = "Clouds"
        XCTAssertEqual(weatherInfo.image, UIImage(named: "image_stone_normal"))
        weatherInfo.temperature = 20.0
        XCTAssertEqual(weatherInfo.image, UIImage(named: "image_stone_cracks"))
    }
    
    func testLocation() throws {
        weatherInfo.updateWeatherInfo(latitude: 55.755786, longtitude: 37.617633, completion: compareTestResults)
    }
    
    func testPerformance() {
        measure {
            WeatherInfo.sharedInstance().updateWeatherInfo(latitude: 55.755786, longtitude: 37.617633)
        }
    }
}
