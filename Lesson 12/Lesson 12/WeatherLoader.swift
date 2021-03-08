//
//  WeatherLoader.swift
//  Lesson 12
//
//  Created by Феликс Фимберг on 04.01.2021.
//

import UIKit

class WeatherLoader {
    
    func loadWeatherWithCodable (completion: @escaping ([Weather]) -> Void) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Moscow&appid=f61e5c33616d26e6682fafb06848c604")!
        
        let request = URLRequest(url: url)
        
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            var weathers: [Weather] = []
            
            let w: WeatherObj = try! JSONDecoder().decode(WeatherObj.self, from: data)
            let weather = Weather(temp: w.main["temp"] ?? 0.0, speed: w.wind["speed"] ?? 0.0, clouds: w.clouds["all"] ?? 0)
            weathers.append(weather)
            DispatchQueue.main.async {
                completion(weathers)
            }
                        
        }.resume()
    }
    
        
    func loadWeather(completion: @escaping ([Weather]) -> Void){
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Moscow&appid=f61e5c33616d26e6682fafb06848c604")!
        let request = URLRequest(url: url)
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
               // is it JSON?
               let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),

               // is it Dictionary?
               let jsonDict = json as? NSDictionary {
                print(jsonDict)
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
        }.resume()
    }
    
    func loadWeatherForFiveDays (completion: @escaping ([Weather], [String]) -> Void) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=Moscow&appid=f61e5c33616d26e6682fafb06848c604")!
        let request = URLRequest(url: url)
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
               let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
               let jsonDict = json as? NSDictionary {
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
                    completion(weathers, dates)
                }
            }
        }.resume()
    }
}
