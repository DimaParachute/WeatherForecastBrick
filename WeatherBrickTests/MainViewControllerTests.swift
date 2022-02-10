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
    var mainViewController: MainViewController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
    }
    
    func testDefaultState() {
        assertSnapshot(matching: mainViewController, as: .image)
    }
}
