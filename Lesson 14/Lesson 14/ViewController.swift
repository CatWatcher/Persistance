//
//  ViewController.swift
//  Lesson 14
//
//  Created by Феликс Фимберг on 08.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var surnameTF: UITextField!
    
//    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        nameTF.placeholder = defaults.string(forKey: "name")
//        surnameTF.placeholder = defaults.string(forKey: "surname")
        
        nameTF.placeholder = UDclass.shared.name
        surnameTF.placeholder = UDclass.shared.surname
    
    }

    @IBAction func confirmBtn(_ sender: UIButton) {
        
        UDclass.shared.defaults.set(surnameTF.text, forKey: Keys.surnameKey.rawValue)
        UDclass.shared.defaults.set(nameTF.text, forKey: Keys.nameKey.rawValue)
        
        
//        defaults.set(nameTF.text, forKey: "name")
//        defaults.set(surnameTF.text, forKey: "surname")
    
    }    
}

