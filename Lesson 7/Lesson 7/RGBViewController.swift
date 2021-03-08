//
//  RGBViewController.swift
//  Lesson 7
//
//  Created by Феликс Фимберг on 05.10.2020.
//

import UIKit

class RGBViewController: UIViewController {
    
    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = color
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        dismiss(animated: true, completion: nil)
    }
}
