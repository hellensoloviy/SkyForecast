//
//  DailyWeatherTableViewContoroller.swift
//  SkyForecast
//
//  Created by Hellen Soloviy on 3/18/19.
//  Copyright © 2019 HellySolovii. All rights reserved.
//

import Foundation
import UIKit

class DailyWeatherTableViewController: UITableViewController {
    static let identifier = "DailyWeatherTableViewController"
    
    //MARK: -
    var weather: WeekWeatherMetadata?
    
    var data: [DailyWeather] {
        return  [] //weather?.week.data ??
    }
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
            let lat = 37.8267
            let lon = -122.4233
        
        NetworkManager().dailyWeather(for: lat, lon: lon) { (isSuccess, error, object) in
            print("Result!")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyWeatherTableViewCell.identifier, for: indexPath) as! DailyWeatherTableViewCell
//        let object = country(for: indexPath.row)
    
//        cell.textLabel!.text = object.nativeName
//        cell.detailTextLabel!.text = object.region
        return cell
    }
    
}

