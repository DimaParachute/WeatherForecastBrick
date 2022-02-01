//
//  Created by Volodymyr Andriienko on 11/3/21.
//  Copyright © 2021 VAndrJ. All rights reserved.
//

import XCTest
@testable import WeatherBrick

class WeatherBrickTests: XCTestCase {
    let mainViewController = MainViewController()
    
    func testPerformance() {
        measure {
            mainViewController.startLocationManager()
        }
    }
}
