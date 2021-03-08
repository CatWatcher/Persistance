//
//  ViewController.swift
//  Temperature
//
//  Created by Феликс Фимберг on 25.08.2020.
//  Copyright © 2020 Феликс Фимберг. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBOutlet weak var textCel: UITextField!
    @IBOutlet weak var textFar: UITextField!
    @IBOutlet weak var slider: UISlider! {
        // Задаем начальные значения для слайдера и значение по умолчанию
        didSet {
            slider.minimumValue = -273
            slider.maximumValue = 1000
            slider.value = 0
        }
    }
    
    
    @IBAction func sliderMove(_ sender: UISlider) {
        
        let celTemp = Int(round(slider.value))
        textCel.text = "\(celTemp)"
        
        let farTemp = Int(round((slider.value * 9 / 5) + 32))
        textFar.text = "\(farTemp)"
        
    }
    
    @IBAction func textChangeFar(_ sender: UITextField) {
        
        guard let farTemp = textFar.text else { return }
        
        let farTempDouble = Double(farTemp)!
        let celsium = Int(round((farTempDouble - 32) * 5 / 9))
        textCel.text = "\(celsium)"
        slider.value = Float(celsium)
        
    }
    
    
    @IBAction func textChangeCel(_ sender: UITextField) {

        guard let celTemp = textCel.text else { return }
        
        let celTempDouble = Double(celTemp)!
        let farengeight = Int(round((celTempDouble * 9 / 5) + 32))
        textFar.text = "\(farengeight)"
        slider.value = Float(celTemp)!
        
    }
}

