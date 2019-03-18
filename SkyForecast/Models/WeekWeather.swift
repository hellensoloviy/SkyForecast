//
//  WeekWeather.swift
//  SkyForecast
//
//  Created by Hellen Soloviy on 3/18/19.
//  Copyright © 2019 HellySolovii. All rights reserved.
//

import Foundation

class WeekWeatherMetadata: Codable {
    var latitude: Double
    var longitude: Double
    var timezone: String
    
    var daily: WeekWeather
}

class WeekWeather: Codable {
    var summary: String
    var icon: String
    
    var data: [DailyWeather]
}
