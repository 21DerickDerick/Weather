//
//  DarkSkyAPIClient.swift
//  Weather
//
//  Created by Derick Derick on 20/12/2017.
//  Copyright © 2017 indiemax. All rights reserved.
//

import Foundation

class DarkSkyAPIClient {
    fileprivate let APIKey = "ad9c4ee9d164713db28ec715d7d77ea5"
    
    lazy var baseUrl: URL = {
        return URL(string: "https://api.darksky.net/forecast/\(self.APIKey)/")!
    }()
    
    let downloader = JSONDownloader()
    
    func getCurrentWeather(at coordinate: Coordinate, completionHandler completion: @escaping (CurrentWeather?, DarkSkyError?) -> Void) {
        
        guard let url = URL(string: coordinate.description, relativeTo: baseUrl) else {
            completion(nil, .invalidUrl)
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = downloader.jsonTask(with: request) { json, error in
            guard let json = json else {
                completion(nil, error)
                return
            }
            
            guard let currentWeatherJson = json["currently"] as? [String: AnyObject], let currentWeather = CurrentWeather(json: currentWeatherJson) else {
                completion(nil, .jsonParsingFailure)
                return
            }
            
            completion(currentWeather, nil)
        }
        
        task.resume()
    }
    
}
