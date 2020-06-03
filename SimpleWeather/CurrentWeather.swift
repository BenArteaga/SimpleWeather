//
//  CurrentWeather.swift
//  SimpleWeather
//
//  Created by Ben Arteaga on 5/26/20.
//  Copyright © 2020 Ben Arteaga. All rights reserved.
//

import Foundation

class CurrentWeather {
    fileprivate var _cityName: String!
    fileprivate var _date: String!
    fileprivate var _weatherType: String!
    fileprivate var _currentTemp: Double!
    fileprivate var _byCity: Bool!
    
    //getter for _cityName
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        //dateFormatter is a class that creates string representations of NSDate objects
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        //Date() is a funtion that retrieves the current date
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    var byCity: Bool {
        get {
            if _byCity == nil {
                return false
            }
            return _byCity
        }
        set {
            _byCity = newValue
        }
    }
    
    //DownloadComplete is our custom closure
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        //The URLSession class is the Apple class that provides the API for downloading content
        let session = URLSession.shared
        var urlString = ""
        if self._byCity! {
            urlString = BYCITY_URL
        }
        else {
            urlString = CURRENT_WEATHER_URL
        }
        let url = URL(string: urlString)!
        
        //dataTask function retrieves the contents of our URL and supplies the data, response, and error in a completion handler
        session.dataTask(with: url) { (data, response, error) in
                if let responseData = data {
                    do {
                        let json = try  JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions.allowFragments)
                        if let dict = json as? Dictionary<String, AnyObject> {
                            if let name = dict["name"] as? String {
                                self._cityName = name.capitalized
                            }
                            
                            if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                                if let main = weather[0]["main"] as? String {
                                    self._weatherType = main.capitalized
                                }
                            }
                            
                            if let main = dict["main"] as? Dictionary<String, AnyObject> {
                                if let currentTemperature = main["temp"] as? Double {
                                    let kelviToFarenheitPreDivision = (currentTemperature * (9/5) - 459.67)
                                    let kelvinToFarenheit = Double(round(10 * kelviToFarenheitPreDivision/10))
                                    self._currentTemp = kelvinToFarenheit
                                }
                            }
                        }
                        print(json)
                    } catch {
                        print("Could not serialize")
                    }
                }
            completed()
            } .resume()
    }
    
}
