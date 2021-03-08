//
//  ViewController.swift
//  Lesson 12
//
//  Created by Феликс Фимберг on 03.01.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var cloudsLabel: UILabel!
    
    var weathers: [Weather] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        WeatherLoader().loadWeatherWithCodable { (weathers2) in
//            self.weathers2 = weathers2
//            self.updateInfo(weather: weathers2[0])
//        }
        self.title = "Current weather"
        
            WeatherLoader().loadWeather { (weathers) in
                self.weathers = weathers
                self.updateInfo(weather: weathers[0])
            }
        
    }
    
    func updateInfo (weather: Weather) {
        self.tempLabel.text = String(weather.temp)
        self.windLabel.text = String(weather.windSpeed)
        self.cloudsLabel.text = String(weather.clouds)
    }
    
    @IBAction func unwindSegue (segue: UIStoryboardSegue) {
    }
}

