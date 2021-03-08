//
//  ViewController.swift
//  Lesson 11.1
//
//  Created by Феликс Фимберг on 05.11.2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let clock = Clock.loadFromNib()
        view.addSubview(clock)
        
        clock.prepareForInterfaceBuilder()
        
        clock.translatesAutoresizingMaskIntoConstraints = true
        clock.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        clock.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]
                
    }


}

