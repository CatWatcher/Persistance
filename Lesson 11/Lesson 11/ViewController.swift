//
//  ViewController.swift
//  Lesson 11
//
//  Created by Феликс Фимберг on 25.10.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mySegmentedControll: MySegmentedControll!
   
    @IBOutlet weak var timerMV: MyView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            mySegmentedControll.delegate = self
            mySegmentedControll.rightLabel.isHidden = true
    }
}

extension ViewController: segmentedDelegate {
    func moveSegment(_ segmentControl: MySegmentedControll) {
            mySegmentedControll.moveView()
    }
}
