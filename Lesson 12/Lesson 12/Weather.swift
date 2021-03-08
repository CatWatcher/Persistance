//
//  Weather.swift
//  Lesson 12
//
//  Created by Феликс Фимберг on 04.01.2021.
//

import UIKit

class Weather {
    
    let temp: Int
    let windSpeed: Double
    let clouds: Int
    
    init(temp: Double, speed: Double, clouds: Int){
        let celsium = temp - 273.15
        self.temp = Int(celsium)
        self.windSpeed = speed
        self.clouds = clouds
    }
}

