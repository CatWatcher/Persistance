//
//  WeatherObj.swift
//  Lesson 12
//
//  Created by Феликс Фимберг on 08.01.2021.
//

import Foundation


struct WeatherObj: Codable {
    let main: [String : Double]
    struct Main: Codable {
        let temp: String
    }
    
    let wind: [String : Double]
    struct Wind: Codable {
        let speed: Int
    }
    let clouds: [String : Int]
    struct Clouds: Codable {
        let all: Int
    }
}
