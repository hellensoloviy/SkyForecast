//
//  LocationAuthorizationViewController.swift
//  SkyForecast
//
//  Created by Hellen Soloviy on 3/18/19.
//  Copyright © 2019 HellySolovii. All rights reserved.
//

import Foundation
import UIKit
import PermissionsService
import CoreLocation

class LocationAuthorizationViewController: UIViewController {
    let identifier = "LocationAuthorizationViewController"
    
    //MARK: - Actions
    @IBAction func authorizationTapped(_ sender: UIButton) {
        LocationAccessManager.shared.isAnonimysUser = false
        makePermissionRequest()
    }
    
    @IBAction func nonAuthorizedUse(_ sender: UIButton) {
        LocationAccessManager.shared.isAnonimysUser = true
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Private
    private func makePermissionRequest() {
        let config = LocationConfiguration(.whenInUse)
        Permission<Location>.prepare(for: self, with: config) { (granted) in
            if granted && (CLLocationManager.authorizationStatus() == .authorizedWhenInUse || CLLocationManager.authorizationStatus() == .authorizedAlways)  {
                print("All is good. Location access granted.")
                self.dismiss(animated: true, completion: nil)
            } else if granted {
                print("Location__ authorization problem!")
            }
        }
    }
    
}

extension LocationAuthorizationViewController: Permissible {
    //no op needed
}
