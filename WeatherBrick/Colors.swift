//
//  Colors.swift
//  WeatherBrick
//
//  Created by Дмитрий Фетюхин on 07.02.2022.
//  Copyright © 2022 VAndrJ. All rights reserved.
//

import Foundation
import UIKit

extension Styles {
    enum Colors {
        static var infoBlockHideButtonTextColor: UIColor {
            return UIColor.systemGray
        }
        static var infoBlockViewBackgroundColor: UIColor {
            return UIColor(red: 255 / 255, green: 154 / 255, blue: 96 / 255, alpha: 1)
        }
        static var infoBlockShadowColor: CGColor {
            return UIColor.black.cgColor
        }
        static var infoBlockHideButtonBorderColor: CGColor {
            return UIColor.systemGray.cgColor
        }
        static var brickPullingSuperViewColor: UIColor {
            return .clear
        }
        static var infoBlockHideButtonBackgroundColor: UIColor {
            return .clear
        }
    }
}
