 //
//  CitySearchView.swift
//  SimpleWeather
//
//  Created by Ben Arteaga on 5/28/20.
//  Copyright © 2020 Ben Arteaga. All rights reserved.
//

import UIKit

class CitySearchView: UIViewController {
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enterButton.layer.cornerRadius = 10
    }

}
