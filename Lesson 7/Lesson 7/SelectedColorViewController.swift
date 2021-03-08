//
//  SelectedColorViewController.swift
//  Lesson 7
//
//  Created by Феликс Фимберг on 03.10.2020.
//

import UIKit

protocol SelectedDeligate {
    func setLabelText(_ text: String)
}

class SelectedColorViewController: UIViewController {
    
    var text = ""
    var color: UIColor?
    var deligate: SelectedDeligate?

    override func viewDidLoad() {
        super.viewDidLoad()
        colorLable.text = text
        self.view.backgroundColor = color
    }

    @IBOutlet weak var colorLable: UILabel!
    
    @IBAction func greenBtn(_ sender: UIButton) {
    }
    
    @IBAction func blueBtn(_ sender: UIButton) {
    }
    
    @IBAction func redBtn(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? SecondViewController else {return}
        switch segue.identifier {
        case "greenSegue":
            vc.color = .green
            colorLable.text = "Green selected"
        case "blueSegue":
            vc.color = .blue
            colorLable.text = "Blue selected"
        case "redSegue":
            vc.color = .red
            colorLable.text = "Red selected"
        default:
            return
        }
        deligate?.setLabelText(colorLable.text!)
    }
}

