//
//  Location.swift
//  SimpleWeather
//
//  Created by Ben Arteaga on 5/26/20.
//  Copyright © 2020 Ben Arteaga. All rights reserved.
//

import Foundation
import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
