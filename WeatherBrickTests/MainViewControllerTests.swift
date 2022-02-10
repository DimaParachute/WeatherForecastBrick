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
    
    override func setUp() {
        super.setUp()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        mainViewController = vc
        _ = mainViewController.view
    }
    
    func testDefaultState() {
        assertSnapshot(matching: mainViewController, as: .image)
    }
}
