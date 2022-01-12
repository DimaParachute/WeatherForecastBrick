//
//  Created by Volodymyr Andriienko on 11/3/21.
//  Copyright © 2021 VAndrJ. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    @IBOutlet weak var countryAndCityNameLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherBrickImageView: UIImageView!
    
    let locationManager = CLLocationManager()
    var weatherData = WeatherData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLocationManager()
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
    
    func updateView() {
        countryAndCityNameLabel.text = "\(weatherData.name), \(weatherData.sys.country)"
        weatherDescriptionLabel.text = weatherData.weather[0].main
        temperatureLabel.text = Int(weatherData.main.temp).description + "°"
        weatherBrickImageView.image = UIImage(named: DataSource.brickImageNameByWeatherStatus[weatherDescriptionLabel.text!]!)
        if weatherDescriptionLabel.text == "Atmosphere" {
            weatherDescriptionLabel.text = "Poor visibility"
            weatherBrickImageView.alpha = 0.5
        }
        if weatherData.wind.speed >= 5.5 {
            weatherBrickImageView.transform = weatherBrickImageView.transform.rotated(by: .pi / 8)
        }
        if weatherData.main.temp >= 20.0 {
            weatherBrickImageView.image = UIImage(named: "image_stone_cracks")
        }
    }
    
    func updateWeatherInfo(latitude: Double, longtitude: Double) {
        let session = URLSession.shared
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?lat=\(latitude.description)&lon=\(longtitude.description)&units=metric&appid=02dd91fbf1b01a29b1b1a226c644bed9")!
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("DataTask error: \(error!.localizedDescription)")
                self.weatherBrickImageView.isHidden = true
                return
            }
            
            do {
                self.weatherData = try JSONDecoder().decode(WeatherData.self, from: data!)
                DispatchQueue.main.async {
                    self.updateView()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            updateWeatherInfo(latitude: lastLocation.coordinate.latitude, longtitude: lastLocation.coordinate.longitude)
        }
    }
}
