//
//  DailyWeather.swift
//  SkyForecast
//
//  Created by Hellen Soloviy on 3/18/19.
//  Copyright © 2019 HellySolovii. All rights reserved.
//

import Foundation

class DailyWeather: Codable {
    
    var description: String
    var conditions: String
    var icon: String
    
    var datetimeEpoc: TimeInterval
    
    var tempmax: Double
    var feelslikemax: Double
    var tempmin: Double
    var feelslikemin: Double
    
    var windspeed: Double
    var visibility: Double
    
}
