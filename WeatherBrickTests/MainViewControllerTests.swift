//
//  MainViewControllerTests.swift
//  WeatherBrickTests
//
//  Created by Дмитрий Фетюхин on 09.02.2022.
//  Copyright © 2022 VAndrJ. All rights reserved.
//

import SnapshotTesting
import XCTest
@testable import WeatherBrick

class MainViewControllerTests: XCTestCase {
    var sut: MainViewController!
    
    override func setUpWithError() throws {
        sut = MainViewController.instantiate()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testDefaultState() {
        assertSnapshot(matching: sut, as: .image(on: .iPhoneXr))
    }
}
