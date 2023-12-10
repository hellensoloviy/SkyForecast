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
<<<<<<< HEAD
    var timezone: String
    var description: String
=======
>>>>>>> updates-latest-p1
    
    var days: [DailyWeather]
}

