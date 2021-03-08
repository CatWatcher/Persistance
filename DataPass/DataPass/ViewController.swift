//
//  ViewController.swift
//  DataPass
//
//  Created by Феликс Фимберг on 30.08.2020.
//  Copyright © 2020 Феликс Фимберг. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // чтобы убирать клавиатуру тапом на экран
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBOutlet weak var LoginText: UITextField!
    @IBOutlet weak var PassText: UITextField!
    
    // Метод для возврата на этот экран с другого экрана
    // Можно оставить пустым для простого возврата, а можно передавать данные
    @IBAction func unwindSegueToMainView(segue: UIStoryboardSegue) {
        self.LoginText.text = ""
        self.PassText.text = ""
    }
    
    
    @IBAction func LoginBtn(_ sender: UIButton) {
    }
    
    // Метод, который выполняется при переходе на новый view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Сега - это наша связьб между view
        // segue.destination - это сега, которая ведет на другой экран
        // segue.source - сега, которая ведет на этот экран
        guard let dvc = segue.destination as? ResultView else { return }
        
        
        //Достаем логин из нашего текст филда
        // и пихаем его в логин из второго view
        dvc.result = LoginText.text
        
    }
}

