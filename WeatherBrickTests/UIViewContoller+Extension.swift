//
//  UIViewContoller+Extension.swift
//  WeatherBrickTests
//
//  Created by Дмитрий Фетюхин on 10.02.2022.
//  Copyright © 2022 VAndrJ. All rights reserved.
//

import UIKit

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}
