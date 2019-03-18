//
//  NetworkManager.swift
//  SkyForecast
//
//  Created by Hellen Soloviy on 3/18/19.
//  Copyright © 2019 HellySolovii. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Config
fileprivate class NetworkConfig {
    static let baseURL = "https://api.darksky.net/forecast/"
    static let apiKey = "aaef37d49b18f8926db06643a78bdd4d"
    
    static var fullBaseURL: String {
        return baseURL + apiKey + "/"
    }
}

class NetworkManager {
    //MARK: - Properties
    
    func dailyWeather(for lat: Double, lon: Double, completion: @escaping ResponseCompletion){
        let baseUrlString = NetworkConfig.baseURL + NetworkConfig.apiKey + "/\(lat),\(lon)"
        let dailyForecastURL = baseUrlString + "?exclude=hourly,minutely,currently,flags"

        guard let url = URL(string: dailyForecastURL) else {
            completion(false, UserError.custom("URL is notVlaid"), nil)
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = RequestType.get
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        request.cachePolicy = .returnCacheDataElseLoad

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
            
            guard error == nil else {
                print("Error while fetching remote rooms: \(String(describing: error))")
                completion(false, UserError.custom(error.debugDescription), nil)
                return
            }
            
            guard let data = data else {
                print("Nil data received from request \(url)")
                completion(false, UserError.serverError, nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode(WeekWeatherMetadata.self, from: data)
                completion(true, nil, model)
            } catch let error {
                print("Data could not be parsed! :'( \(error.localizedDescription)")
                completion(false, UserError.serverError, nil)
            }
        }
        
        task.resume()
    }
    
    
}


