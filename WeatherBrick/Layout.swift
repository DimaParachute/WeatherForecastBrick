//
//  Layot.swift
//  WeatherBrick
//
//  Created by Дмитрий Фетюхин on 04.02.2022.
//  Copyright © 2022 VAndrJ. All rights reserved.
//

import Foundation
import UIKit

extension Styles {
    enum Layout {
        static var brickStartingPosition: CGFloat {
            return 227.5
        }
        static var brickRotationAngle: Double {
            return Double.pi / 12.0
        }
        static var infoBlockShadowOffset: CGSize {
            return CGSize(width: 0, height: 8)
        }
        enum InfoBlock {
            static var buttonBorderWidth: CGFloat {
                return 1
            }
            static let buttonHeight = 31
            static let buttonWidth = 115
            static var defaultCornerRadius: CGFloat {
                return 15
            }
            static let width = 300
            static let height = 400
        }
        enum Constraints {
            enum Left {
                static func defaultValue() -> Int {
                    return 10
                }
            }
            enum Top {
                static let title = 15
                static let wet = 60
                static let dry = 90
                static let fog = 120
                static let cracks = 150
                static let snow = 180
                static let swinging = 210
                static let gone = 240
            }
            enum Bottom {
                static let hideButton = 15
            }
        }
    }
}
