//
//  Created by Volodymyr Andriienko on 11/3/21.
//  Copyright © 2021 VAndrJ. All rights reserved.
//

import UIKit
import CoreLocation
import SnapKit

class MainViewController: UIViewController {
    @IBOutlet weak var countryAndCityNameLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherBrickImageView: UIImageView!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var brickPullingSuperView: UIView!
    
    let locationManager = CLLocationManager()
    var weatherData = WeatherData()
    var infoBlockView = InfoBlockView()
    let weatherUpdatingActivityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherUpdatingActivityIndicatorInitialize()
        brickPullingSuperView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        startLocationManager()
        infoBlockViewInitialize()
        infoBlockView.infoBlockHideButton.addTarget(self, action: #selector(infoBlockHideButtonTouched), for: .touchUpInside)
        gesturesInitialize()
    }
    
    func updateView() {
        weatherUpdatingActivityIndicator.stopAnimating()
        weatherUpdatingActivityIndicator.isHidden = true
        countryAndCityNameLabel.text = "\(weatherData.name), \(weatherData.sys.fullCountryName ?? "")"
        weatherDescriptionLabel.text = weatherData.weather[0].main
        temperatureLabel.text = Int(weatherData.main.temp).description + "°"
        weatherBrickImageView.image = UIImage(named: DataSource.brickImageNameByWeatherStatus[weatherDescriptionLabel.text!]!)
        if weatherDescriptionLabel.text == "Atmosphere" {
            weatherDescriptionLabel.text = "Poor visibility"
            weatherBrickImageView.alpha = 0.5
        }
        if weatherData.wind.speed >= 8.0 {
            weatherBrickImageView.transform = weatherBrickImageView.transform.rotated(by: .pi / 12)
        }
        if weatherData.main.temp >= 20.0 {
            weatherBrickImageView.image = UIImage(named: "image_stone_cracks")
        }
    }
    
    func updateWeatherInfo(latitude: Double, longtitude: Double) {
        weatherUpdatingActivityIndicator.isHidden = false
        weatherUpdatingActivityIndicator.startAnimating()
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
    
    @IBAction func infoButtonTouched(_ sender: UIButton) {
        infoBlockView.isHidden = false
        countryAndCityNameLabel.isHidden = true
        weatherDescriptionLabel.isHidden = true
        temperatureLabel.isHidden = true
        weatherBrickImageView.isHidden = true
        infoButton.isHidden = true
        searchImageView.isHidden = true
        locationImageView.isHidden = true
    }
    
    @objc func infoBlockHideButtonTouched(_ sender: UIButton) {
        infoBlockView.isHidden = true
        countryAndCityNameLabel.isHidden = false
        weatherDescriptionLabel.isHidden = false
        temperatureLabel.isHidden = false
        weatherBrickImageView.isHidden = false
        infoButton.isHidden = false
        searchImageView.isHidden = false
        locationImageView.isHidden = false
    }
    
    private func weatherUpdatingActivityIndicatorInitialize() {
        view.addSubview(weatherUpdatingActivityIndicator)
        weatherUpdatingActivityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private func infoBlockViewInitialize() {
        view.addSubview(infoBlockView)
        infoBlockView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private func gesturesInitialize() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pullTheBrick))
        brickPullingSuperView.addGestureRecognizer(panGestureRecognizer)
    }
}
