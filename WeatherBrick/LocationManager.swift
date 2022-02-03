//
//  LocationManager.swift
//  WeatherBrick
//
//  Created by Дмитрий Фетюхин on 15.01.2022.
//  Copyright © 2022 VAndrJ. All rights reserved.
//

import Foundation
import CoreLocation

extension MainViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            weatherUpdatingActivityIndicator.isHidden = false
            weatherUpdatingActivityIndicator.startAnimating()
            weatherInfo.updateWeatherInfo(latitude: lastLocation.coordinate.latitude, longtitude: lastLocation.coordinate.longitude, completion: updateView)
        }
    }
    
    func startLocationManager() {
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.pausesLocationUpdatesAutomatically = false
            locationManager.startUpdatingLocation()
        }
    }
}
