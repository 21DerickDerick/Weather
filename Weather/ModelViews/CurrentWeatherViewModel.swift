//
//  CurrentWeatherViewModel.swift
//  Weather
//
//  Created by Derick Derick on 20/12/2017.
//  Copyright © 2017 indiemax. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWeatherViewModel {
    let temperature: String
    let humidity: String
    let precipitationProbability: String
    let summary: String
    let icon: UIImage
    
    init(model: CurrentWeather) {
        
        let roundedTemperature = Int(model.temperature)
        self.temperature = "\(roundedTemperature)º"
        
        let humidityPercentValue = Int(model.humidity * 100)
        self.humidity = "\(humidityPercentValue)%"
        
        let precipitationPercentValue = Int(model.precipitationProbability * 100)
        self.precipitationProbability = "\(precipitationPercentValue)%"
        
        self.summary = model.summary
        
        let weatherIcon = WeatherIcon(iconString: model.icon)
        self.icon = weatherIcon.image
    }
}