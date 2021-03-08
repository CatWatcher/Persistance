//
//  FirrsViewController.swift
//  Lesson 7
//
//  Created by Феликс Фимберг on 30.09.2020.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func greenBtn(_ sender: UIButton) {
    }
    
    @IBAction func blueBtn(_ sender: UIButton) {
    }
    
    @IBAction func redBtn(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? RGBViewController else {
            return
        }
        
        switch segue.identifier {
        case "greenSegue":
            vc.color = .green
        case "blueSegue":
            vc.color = .blue
        case "redSegue":
            vc.color = .red
        default:
            print("Default case")
        }
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
    }
}
