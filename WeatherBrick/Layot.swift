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
    enum Layot {
        static var brickStartingPosition: CGFloat {
            return 227.5
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
