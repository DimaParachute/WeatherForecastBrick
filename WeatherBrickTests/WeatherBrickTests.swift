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
        XCTAssertNotEqual(weatherInfo.temperature, 0.0)
        XCTAssertNotEqual(weatherInfo.windSpeed, 0.0)
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
