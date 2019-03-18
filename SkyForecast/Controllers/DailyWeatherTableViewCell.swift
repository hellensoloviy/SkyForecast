//
//  DailyWeatherTableViewCell.swift
//  SkyForecast
//
//  Created by Hellen Soloviy on 3/18/19.
//  Copyright © 2019 HellySolovii. All rights reserved.
//

import Foundation
import UIKit

class DailyWeatherTableViewCell: UITableViewCell {
    static let identifier = "DailyWeatherTableViewCell"
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempratureLabel: UILabel!
    
}
