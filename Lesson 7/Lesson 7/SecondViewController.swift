//
//  SecondViewController.swift
//  Lesson 7
//
//  Created by Феликс Фимберг on 30.09.2020.
//

import UIKit

class SecondViewController: UIViewController {
    
    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var selectedLabel: UILabel!
    
    @IBAction func changeBtn(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SelectedColorViewController, segue.identifier == "secondSegue" {
            vc.text = selectedLabel.text!
            vc.color = self.view.backgroundColor
            vc.deligate = self
        }
    }
    
    @IBAction func secondUnwindSegue (segue: UIStoryboardSegue) {
        self.view.backgroundColor = color
    }
}

extension SecondViewController: SelectedDeligate {
    func setLabelText(_ text: String) {
        selectedLabel.text = text
    }
}
