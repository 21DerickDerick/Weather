//
//  Coordinate.swift
//  Weather
//
//  Created by Derick Derick on 20/12/2017.
//  Copyright © 2017 indiemax. All rights reserved.
//

import Foundation

struct Coordinate {
    let latitude: Double
    let longitude: Double
}

extension Coordinate: CustomStringConvertible {
    var description: String {
        return "\(latitude),\(longitude)"
    }
}
