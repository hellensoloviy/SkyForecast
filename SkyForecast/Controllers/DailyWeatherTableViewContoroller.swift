//
//  DailyWeatherTableViewContoroller.swift
//  SkyForecast
//
//  Created by Hellen Soloviy on 3/18/19.
//  Copyright © 2019 HellySolovii. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class DailyWeatherTableViewController: UITableViewController {
    static let identifier = "DailyWeatherTableViewController"
    
    //MARK: -
    var weather: WeekWeatherMetadata?{
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.title = self.weather?.timezone ?? ""
            }
        }
    }
    
    var data: [DailyWeather] {
        return  weather?.daily.data ?? []
    }
    
    lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        return manager
    }()
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !LocationAccessManager.shared.isLocationAccessGranted(), !LocationAccessManager.shared.isAnonimysUser {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: Constants.Segue.presentAuthorization, sender: nil)
            }
        }
        
        self.tableView.tableFooterView = UIView.init()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var lat = LocationAccessManager.shared.defaultLat
        var lon = LocationAccessManager.shared.defaultLon
        
        if !LocationAccessManager.shared.isAnonimysUser, let location = locationManager.location {
            lat = location.coordinate.latitude
            lon = location.coordinate.longitude
        }
        
        NetworkManager().dailyWeather(for: lat, lon: lon) { (isSuccess, error, object) in
            print("Result! - \(isSuccess)")
            if (isSuccess) {
                self.weather = object
            } else if let error = error {
                self.showError(error.descriptor)
                self.weather = nil
            } else {
                self.weather = nil
            }
        }
        
    }
    
    //MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyWeatherTableViewCell.identifier, for: indexPath) as! DailyWeatherTableViewCell
    
        let object = data[indexPath.row]
        cell.setup(with: object)
        return cell
    }
    
}

