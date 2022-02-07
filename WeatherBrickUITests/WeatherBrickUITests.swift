//
//  Created by Volodymyr Andriienko on 11/3/21.
//  Copyright © 2021 VAndrJ. All rights reserved.
//

import XCTest

class WeatherBrickUITests: XCTestCase {
    private let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func testUIElements() throws {
        XCTAssertTrue(app.images["brickImage"].exists)
        app.buttons["INFO"].tap()
        XCTAssertTrue(app.staticTexts["Brick is wet - raining"].exists)
        app.buttons["Hide"].tap()
        XCTAssertTrue(app.images["brickImage"].exists)
        app.images["brickImage"].swipeDown()
        XCTAssertTrue(app.activityIndicators["weatherUpdatingActivityIndicator"].exists)
    }
}
