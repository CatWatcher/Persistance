//
//  CalculatorViewController.swift
//  Lesson 6
//
//  Created by Феликс Фимберг on 26.09.2020.
//

import UIKit

class CalculatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var result: Double = 0
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var n1TF: UITextField!
    @IBOutlet weak var n2TF: UITextField!
    @IBOutlet weak var signTF: UITextField!
    
    @IBAction func calculateBtn(_ sender: UIButton) {
        guard let n1: Double = Double(n1TF.text ?? "") else {
            resultLabel.text = "Некорректные данные"
            return
        }
        guard let n2: Double = Double(n2TF.text ?? "") else {
            resultLabel.text = "Некорректные данные"
            return
        }
        
        switch signTF.text {
        case "+":
            result = n1 + n2
            resultLabel.text = String(result)
        case "-":
            result = n1 - n2
            resultLabel.text = String(result)
        case "*":
            result = n1 * n2
            resultLabel.text = String(result)
        case "/":
            result = n1 / n2
            resultLabel.text = String(result)
        default:
            resultLabel.text = "Некорректный знак"
        }
    }
}
