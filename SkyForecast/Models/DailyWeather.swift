//
//  DailyWeather.swift
//  SkyForecast
//
//  Created by Hellen Soloviy on 3/18/19.
//  Copyright © 2019 HellySolovii. All rights reserved.
//

import Foundation

class DailyWeather: Codable {
    var summary: String
    var icon: String
    var precipType: String
    
    var time: TimeInterval
    
    var apparentTemperatureHigh: Double
    var apparentTemperatureHighTime: Double
    var apparentTemperatureLow: Double
    var apparentTemperatureLowTime: Double
    
    var windSpeed: Double
    var visibility: Double
    
}
