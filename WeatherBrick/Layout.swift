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
            static var defaultCornerRadius: CGFloat {
                return 15
            }
        }
        enum Constraints {
            enum Left {
                static func defaultValue() -> Int {
                    return 10
                }
            }
        }
    }
}
