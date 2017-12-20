//
//  DarkSkyError.swift
//  Weather
//
//  Created by Derick Derick on 20/12/2017.
//  Copyright © 2017 indiemax. All rights reserved.
//

import Foundation

enum DarkSkyError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case invalidUrl
    case jsonParsingFailure
}
