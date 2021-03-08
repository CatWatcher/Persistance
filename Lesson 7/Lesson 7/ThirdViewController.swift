//
//  ThirdViewController.swift
//  Lesson 7
//
//  Created by Феликс Фимберг on 30.09.2020.
//

import UIKit

class ThirdViewController: UIViewController {
    
    private var littleVC: LittleViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func greenBtn(_ sender: UIButton) {
        littleVC?.currentColor = .green
    }
    
    @IBAction func yellowBtn(_ sender: UIButton) {
        littleVC?.currentColor = .yellow
    }
    
    @IBAction func purpleBtn(_ sender: UIButton) {
        littleVC?.currentColor = .purple
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? LittleViewController, segue.identifier == "embedSegue" {
            littleVC = vc
            vc.deligate = self
        }
    }
}

extension ThirdViewController: LittleDeligate {
    func changeBG(_ color: UIColor) {
        self.view.backgroundColor = color
    }
}



