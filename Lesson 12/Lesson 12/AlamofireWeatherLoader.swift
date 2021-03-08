//
//  AlamofireWeatherLoader.swift
//  Lesson 12
//
//  Created by Феликс Фимберг on 25.01.2021.
//

import Foundation
import Alamofire

class AlamofireWeatherLoader {
    
    func loadWeather (completion: @escaping ([Weather]) -> Void) {
        AF.request(_: "https://api.openweathermap.org/data/2.5/weather?q=Moscow&appid=f61e5c33616d26e6682fafb06848c604").responseJSON { (response) in
            if let data = response.value,
               let jsonDict = data as? NSDictionary {
                
                var weathers: [Weather] = []
                                
                let wind = jsonDict["wind"] as! NSDictionary
                let speed = wind["speed"] as! Double
                
                let main = jsonDict["main"] as! NSDictionary
                let temp = main["temp"] as! Double

                
                let clouds = jsonDict["clouds"] as! NSDictionary
                let all = clouds["all"] as! Int

                let w = Weather(temp: temp, speed: speed, clouds: all)
                
                DispatchQueue.main.async {
                    weathers.append(w)
                    completion(weathers)
                }
            }
        }
    }
    
    func loadWeatherForFiveDays (completion: @escaping ([Weather], [String]) -> Void) {
        AF.request(_: "https://api.openweathermap.org/data/2.5/forecast?q=Moscow&appid=f61e5c33616d26e6682fafb06848c604").responseJSON { (response) in
            if let data = response.value,
               let jsonDict = data as? NSDictionary {
                var weathers: [Weather] = []
                var dates: [String] = []
                
                let list = jsonDict["list"] as! NSArray
                
                for item in list {
                    if let itemDict = item as? NSDictionary {
                        let wind = itemDict["wind"] as! NSDictionary
                        let speed = wind["speed"] as! Double
                        
                        let main = itemDict["main"] as! NSDictionary
                        let temp = main["temp"] as! Double

                        
                        let clouds = itemDict["clouds"] as! NSDictionary
                        let all = clouds["all"] as! Int
                        
                        let data = itemDict["dt_txt"] as! String

                        let w = Weather(temp: temp, speed: speed, clouds: all)
                        dates.append(data)
                        weathers.append(w)
                    }
                }
                
                
                DispatchQueue.main.async {
                    
                    print(weathers)
                    print(dates)
                    completion(weathers, dates)
                }
            }
        }
    }
}
