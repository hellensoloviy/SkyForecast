//
//  CLong+Duration.swift
//  SkyForecast
//
//  Created by Hellen Soloviy on 3/18/19.
//  Copyright © 2019 HellySolovii. All rights reserved.
//

import Foundation

extension CLong {
    var timeInterval : TimeInterval {
        return TimeInterval(self / 1000)
    }
}
