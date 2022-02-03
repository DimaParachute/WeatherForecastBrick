//
//  PullTheBrick.swift
//  WeatherBrick
//
//  Created by Дмитрий Фетюхин on 15.01.2022.
//  Copyright © 2022 VAndrJ. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController {
    @objc func pullTheBrick(recognizer: UIPanGestureRecognizer) {
        let brickStartingPosition: CGFloat = 227.5
        if recognizer.state == .began {
        } else if recognizer.state == .changed {
            let translation = recognizer.translation(in: self.view)
            let newY = brickPullingSuperView.center.y + translation.y
            brickPullingSuperView.center = CGPoint(x: brickPullingSuperView.center.x, y: newY)
            recognizer.setTranslation(CGPoint.zero, in: self.view)
        } else if recognizer.state == .ended {
            brickPullingSuperView.center.y = brickStartingPosition
            weatherUpdatingActivityIndicator.isHidden = false
            weatherUpdatingActivityIndicator.startAnimating()
            weatherInfo.updateWeatherInfo(latitude: (locationManager.location?.coordinate.latitude)!, longtitude: (locationManager.location?.coordinate.longitude)!, completion: updateView)
        }
    }
}
