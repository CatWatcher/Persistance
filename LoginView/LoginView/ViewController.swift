//
//  ViewController.swift
//  LoginView
//
//  Created by Феликс Фимберг on 24.08.2020.
//  Copyright © 2020 Феликс Фимберг. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var underButton: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func Button(_ sender: UIButton) {
        underButton.text = "Great! Welcome to the Earth"
    }
}

