//
//  Created by Volodymyr Andriienko on 11/3/21.
//  Copyright © 2021 VAndrJ. All rights reserved.
//

import XCTest
@testable import WeatherBrick

class WeatherBrickTests: XCTestCase {
    func testPerformance() {
        measure {
            WeatherInfo.sharedInstance().updateWeatherInfo(latitude: 55.7522, longtitude: 37.6156)
        }
    }
}
