//
//  NetworkConstants.swift
//  SkyForecast
//
//  Created by Hellen Soloviy on 3/18/19.
//  Copyright © 2019 HellySolovii. All rights reserved.
//

import Foundation

//MARK: - Complitions 
typealias ResponseCompletion = (_ success: Bool, _ error: UserError?,_ response: WeekWeatherMetadata?) -> Void
typealias RequestResultBlock = (Bool, UserError?) -> Void

//MARK: -
struct RequestType {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let head = "HEAD"
}

//MARK: - Error
public enum UserError: Error {
    case custom(String)
    
    case serverError
    case noInternet
    case unknown
    
    var descriptor: String {
        get {
            switch self {
            case .custom(let string):
                return string
            case .serverError:
                return "Something went wrong, but it's not your fault"
            case .noInternet:
                return "Internet connection is currenly unavailable"
            case .unknown:
                return "Unknown error occured! :("
            }
        }
    }
}
