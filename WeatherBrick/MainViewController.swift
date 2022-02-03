//
//  Created by Volodymyr Andriienko on 11/3/21.
//  Copyright © 2021 VAndrJ. All rights reserved.
//

import UIKit
import CoreLocation
import SnapKit

class MainViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var countryAndCityNameLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherBrickImageView: UIImageView!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var brickPullingSuperView: UIView!
    
    //MARK: - Class instances
    let locationManager = CLLocationManager()
    let weatherInfo = WeatherInfo.sharedInstance()
    var infoBlockView = InfoBlockView()
    let weatherUpdatingActivityIndicator = UIActivityIndicatorView()
    
    //MARK: - Standard values
    private let highestPointOfNormalTemperature = 19.9
    private let highestPointOfNormalWind = 7.9
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherUpdatingActivityIndicator.accessibilityIdentifier = "weatherUpdatingActivityIndicator"
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
        guard weatherInfo.noInternet == false else {
            self.weatherBrickImageView.isHidden = true
            return
        }
        countryAndCityNameLabel.text = weatherInfo.cityAndCountry
        weatherDescriptionLabel.text = weatherInfo.status
        temperatureLabel.text = Int(weatherInfo.temperature).description + "°"
        weatherBrickImageView.image = UIImage(named: DataSource.brickImageNameByWeatherStatus[weatherInfo.status]!)
        if weatherDescriptionLabel.text == "Atmosphere" {
            weatherDescriptionLabel.text = "Poor visibility"
            weatherBrickImageView.alpha = 0.5
        }
        if weatherInfo.windSpeed > highestPointOfNormalWind {
                weatherBrickImageView.transform = CGAffineTransform(rotationAngle: .pi / 12)
        } else {
                weatherBrickImageView.transform = CGAffineTransform.identity
        }

        if weatherInfo.temperature > highestPointOfNormalTemperature {
            weatherBrickImageView.image = UIImage(named: "image_stone_cracks")
        }
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
