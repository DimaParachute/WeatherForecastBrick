//
//  Fonts.swift
//  WeatherBrick
//
//  Created by Дмитрий Фетюхин on 04.02.2022.
//  Copyright © 2022 VAndrJ. All rights reserved.
//

import Foundation
import UIKit

extension Styles {
    enum Fonts {
        static var conditionLabelsFont: UIFont {
            return .systemFont(ofSize: 20)
        }
        static var infoBlockTitleFont: UIFont {
            return .systemFont(ofSize: 30, weight: .semibold)
        }
        static var infoBlockHideButtonTitleFont: UIFont {
            return .systemFont(ofSize: 15, weight: .semibold)
        }
    }
}
