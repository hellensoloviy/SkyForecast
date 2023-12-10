//
//  ViewController+Alert.swift
//  SkyForecast
//
//  Created by Hellen Soloviy on 3/18/19.
//  Copyright © 2019 HellySolovii. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error occured", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel) { _ in
            fatalError()
        })
        
        DispatchQueue.main.sync {
            self.present(alert, animated: true, completion: nil)
        }
<<<<<<< HEAD
=======
    }
    
}

//
//  ViewController+Alert.swift
//  SkyForecast
//
//  Created by Hellen Soloviy on 3/18/19.
//  Copyright © 2019 HellySolovii. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error occured", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        alert.addAction(settings)
        alert.preferredAction = settings
        present(alert, animated: true, completion: nil)
>>>>>>> updates-latest-p1
    }
    
}
