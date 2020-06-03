//
//  Constants.swift
//  SimpleWeather
//
//  Created by Ben Arteaga on 5/26/20.
//  Copyright © 2020 Ben Arteaga. All rights reserved.
//

import Foundation

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=cf578d8c3a621507a35f1cb93c9e3657"


var BYCITY_URL = "http://api.openweathermap.org/data/2.5/weather?q=\(Location.sharedInstance.cityName!)&appid=cf578d8c3a621507a35f1cb93c9e3657"

func updateCityUrl() {
    BYCITY_URL = "http://api.openweathermap.org/data/2.5/weather?q=\(Location.sharedInstance.cityName!)&appid=cf578d8c3a621507a35f1cb93c9e3657"
}

