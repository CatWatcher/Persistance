//
//  SecondViewController.swift
//  Lesson 9
//
//  Created by Феликс Фимберг on 12.10.2020.
//

import UIKit

class SecondViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    @IBOutlet weak var changableLabel: UILabel!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if heightConstraint.constant == 105 {
            heightConstraint.constant = 21
        } else {
            heightConstraint.constant *= 5
        }
    }
}
