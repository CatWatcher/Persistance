//
//  ViewController.swift
//  Lesson 6
//
//  Created by Феликс Фимберг on 26.09.2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    var array: [String] = []
    let two = 2
    
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var infoTF: UITextField!
    
    @IBAction func doneBtn(_ sender: Any) {
        if let degree: Int = Int(infoTF.text ?? "") {
            var temp = 2
            for _ in 1..<degree {
                temp *= two
            }
            helloLabel.text = String(temp)
        } else {
            array.insert(String(infoTF.text ?? ""), at: 0)
            let result = String(array.joined(separator: " "))
            helloLabel.text = result
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func unwindSegue (segue: UIStoryboardSegue) {}
}

