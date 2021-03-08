//
//  LittleViewController.swift
//  Lesson 7
//
//  Created by Феликс Фимберг on 03.10.2020.
//

import UIKit

protocol LittleDeligate {
    func changeBG(_ color: UIColor)
}

class LittleViewController: UIViewController {
    
    var currentColor: UIColor? {
        didSet {
            self.view.backgroundColor = currentColor
        }
    }
    
    var deligate: LittleDeligate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func greenBtn(_ sender: UIButton) {
        deligate?.changeBG(.green)
    }
    
    @IBAction func yellowBtn(_ sender: UIButton) {
        deligate?.changeBG(.yellow)
    }
    
    @IBAction func purpleBtn(_ sender: UIButton) {
        deligate?.changeBG(.purple)
    }
}
