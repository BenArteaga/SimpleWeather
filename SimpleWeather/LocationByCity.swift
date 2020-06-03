//
//  LocationBtCity.swift
//  SimpleWeather
//
//  Created by Ben Arteaga on 5/28/20.
//  Copyright © 2020 Ben Arteaga. All rights reserved.
//

import Foundation
import CoreLocation

class LocationByCity {
    static var sharedInstance = LocationByCity()
    private init() {}
    
    var cityName: String!
    
}
