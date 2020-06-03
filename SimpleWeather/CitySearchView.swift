 //
//  CitySearchView.swift
//  SimpleWeather
//
//  Created by Ben Arteaga on 5/28/20.
//  Copyright © 2020 Ben Arteaga. All rights reserved.
//

import UIKit
 
 //this delegate protocol will allow this view to pass information (in the form of cityWeather) back to the original view
 protocol CitySearchViewDelegate : NSObjectProtocol {
     func doSomethingWith(data: CurrentWeather!)
 }

class CitySearchView: UIViewController {
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var cityTextField: UITextField!
    weak var delegate : CitySearchViewDelegate?
    
    var cityWeather: CurrentWeather!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enterButton.layer.cornerRadius = 10
    }

    @IBAction func enterWasPressed(_ sender: UIButton) {
        if let city = cityTextField.text {
            Location.sharedInstance.cityName = city
            updateCityUrl()
        }
//        cityWeather.byCity = true
        if let delegate = delegate {
            delegate.doSomethingWith(data: cityWeather)
        }
        dismiss(animated: true, completion: nil)
    }

 }
 
 
